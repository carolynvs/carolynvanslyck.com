---
comments: false
date: "2022-02-20"
title: "Add Issues and Pull Requests to a GitHub Project"
slug: add-to-github-project
description: >
  Automatically add issues and pull requests to your GitHub project
image: images/add-to-project-twittercard.png
cardStyle: summary_large_image
---

<figure>
  <img src="/images/manufacturetocat.png" alt="GitHub's Octocat, an octopus with a cat face, wearing a hard hat standing in front of a manufacturing line, using their laptop" />
  <figcaption><a href="https://octodex.github.com/manufacturetocat/">Automating GitHub with Octocat</a></figcaption>
</figure>

Do you want to add all new issues and pull requests to a GitHub project board?
Adding them manually to the board inevitably results in missed issues and a stale, less-than-helpful board.
Learn how to use the [assign-one-project] GitHub action to automate adding issues and pull requests to your board.

[assign-one-project]: https://github.com/marketplace/actions/assign-to-one-project

## How it works

The action works by:

1. Responding to events such as a new issue or pull request being created, or labels added.
  Triggering on adding labels allows you to use conditionals in the workflow to customize which project or column to add it to.
1. Adding the issue or pull request to a project board.
1. By default it adds issues to the "To Do" column and pull requests to the "In Progress" column.
  You can customize this to fit with your project's naming conventions.

## Create a Personal Access Token
  
🛑 This step is only necessary if you are using an organization level project.
If you are using a repository level project, skip to the next section.

1. [Create a personal access token](https://github.com/settings/tokens/) for a user with admin permissions for the organization.
  The token needs **repo** and **admin:org** permissions.
1. Either at the repository or organization level create a secret named **ASSIGN_PROJECT_TOKEN** with the personal access token.

![screenshot of the personal access token permissions with repo and admin:org checked](/images/assign-one-project-token-permissions.png)

## Create a workflow

1. In your repository, make a directory named **.github/workflows**.
1. Add a file named **assign-to-project.yaml** in the workflows directory with the following contents, replacing PROJECT_URL with your project board's URL.
    ```yaml
    # This workflow assigns to issues and pull requests to a project board

    on:
      # This workflow acts on issues, and pull requests
      issues:
        # Trigger when an issue is opened or a label is added
        # If you always want it added to the same project and column, remove the "labeled" type.
        types: [opened, labeled]
      # Use pull_request_target so that this triggers for pull requests from forks
      pull_request_target:
        # Trigger when a pull request is opened or a label is added
        # If you always want it added to the same project and column, remove the "labeled" type.
        types: [opened, labeled]
    env:
      # Repository projects can use the default GITHUB_TOKEN secret
      MY_GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      # For organization projects, use the ASSIGN_PROJECT_TOKEN secret created previously
      # MY_GITHUB_TOKEN: ${{ secrets.ASSIGN_PROJECT_TOKEN }}

    jobs:
      assign_one_project:
        runs-on: ubuntu-latest
        name: Assign to Project
        steps:
        # Add issues to the To Do column
        - name: Assign Issue to Project
          # https://github.com/marketplace/actions/assign-to-one-project
          uses: srggrs/assign-one-project-github-action@1.3.1
          if: ${{ github.event_name == 'issues' }}
          with:
            project: 'PROJECT_URL'
            column_name: 'To Do'
        # Add pull requests to the In Progress column
        - name: Assign Pull Request to Project
          # https://github.com/marketplace/actions/assign-to-one-project
          uses: srggrs/assign-one-project-github-action@1.3.1
          if: ${{ github.event_name == 'pull_request_target' }}
          with:
            project: 'PROJECT_URL'
            column_name: 'In Progress'
    ```
1. Commit your changes and push it to the default branch in your repository.
  I recommend creating a new throwaway repository to test this change first.
  Then once you have it configured properly, then apply your changes to the real repository.

## Test adding issues to a project

1. Create an issue.
1. Watch the action run and then view the logs from the Actions tab in your repository, 

    ℹ️ Note that the "No project was found" message doesn't prevent the action from executing successfully.
    ```
    No project was found.
    {
      "url": "https://api.github.com/projects/columns/cards/77991806",
      "project_url": "https://api.github.com/projects/5484241",
      "id": 77991806,
      "node_id": "PRC_lADOA2ikss4AU67RzgSmD34",
      "note": null,
      "archived": false,
      "creator": {
        "login": "getporterbot",
        "id": 64092027,
        "node_id": "MDQ6VXNlcjY0MDkyMDI3",
        "avatar_url": "https://avatars.githubusercontent.com/u/64092027?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/getporterbot",
        "html_url": "https://github.com/getporterbot",
        "followers_url": "https://api.github.com/users/getporterbot/followers",
        "following_url": "https://api.github.com/users/getporterbot/following{/other_user}",
        "gists_url": "https://api.github.com/users/getporterbot/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/getporterbot/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/getporterbot/subscriptions",
        "organizations_url": "https://api.github.com/users/getporterbot/orgs",
        "repos_url": "https://api.github.com/users/getporterbot/repos",
        "events_url": "https://api.github.com/users/getporterbot/events{/privacy}",
        "received_events_url": "https://api.github.com/users/getporterbot/received_events",
        "type": "User",
        "site_admin": false
      },
      "created_at": "2022-02-20T18:47:23Z",
      "updated_at": "2022-02-20T18:47:23Z",
      "column_url": "https://api.github.com/projects/columns/10859770",
      "content_url": "https://api.github.com/repos/getporter/test/issues/4"
    }
    ```
1. Verify that the issue was added to the To Do column of your project board.
1. Add a label to the test issue. Removing a label does not trigger the action.
1. On the Actions tab and look at the logs from the triggered action.
  The action detected that the issue is already on the project, and skipped adding it again.
    ```
    No project was found.
    {
      "message": "Validation Failed",
      "errors": [
        {
          "resource": "ProjectCard",
          "code": "unprocessable",
          "field": "data",
          "message": "Project already has the associated issue"
        }
      ],
      "documentation_url": "https://docs.github.com/v3/projects/cards/#create-a-project-card"
    }
    ```

## Test Adding pull requests to a project

1. Create a pull request from a fork against the repository.
1. Watch the action run and then view the logs from the Actions tab in your repository, 

    ℹ️ Note that the "No project was found" message doesn't prevent the action from executing successfully.
    ```
    No project was found.
    {
      "url": "https://api.github.com/projects/columns/cards/77991891",
      "project_url": "https://api.github.com/projects/5484241",
      "id": 77991891,
      "node_id": "PRC_lADOA2ikss4AU67RzgSmD9M",
      "note": null,
      "archived": false,
      "creator": {
        "login": "getporterbot",
        "id": 64092027,
        "node_id": "MDQ6VXNlcjY0MDkyMDI3",
        "avatar_url": "https://avatars.githubusercontent.com/u/64092027?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/getporterbot",
        "html_url": "https://github.com/getporterbot",
        "followers_url": "https://api.github.com/users/getporterbot/followers",
        "following_url": "https://api.github.com/users/getporterbot/following{/other_user}",
        "gists_url": "https://api.github.com/users/getporterbot/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/getporterbot/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/getporterbot/subscriptions",
        "organizations_url": "https://api.github.com/users/getporterbot/orgs",
        "repos_url": "https://api.github.com/users/getporterbot/repos",
        "events_url": "https://api.github.com/users/getporterbot/events{/privacy}",
        "received_events_url": "https://api.github.com/users/getporterbot/received_events",
        "type": "User",
        "site_admin": false
      },
      "created_at": "2022-02-20T18:52:49Z",
      "updated_at": "2022-02-20T18:52:49Z",
      "column_url": "https://api.github.com/projects/columns/10859772",
      "content_url": "https://api.github.com/repos/getporter/test/issues/5"
    }
    ```
1. Verify that the issue was added to the To Do column of your project board.
1. Add a label to the test issue. Removing a label does not trigger the action.
1. On the Actions tab and look at the logs from the triggered action.
  The action detected that the issue is already on the project, and skipped adding it again.
    ```
    No project was found.
    {
      "message": "Validation Failed",
      "errors": [
        {
          "resource": "ProjectCard",
          "code": "unprocessable",
          "field": "data",
          "message": "Project already has the associated issue"
        }
      ],
      "documentation_url": "https://docs.github.com/v3/projects/cards/#create-a-project-card"
    }
    ```

## Wrap it up

That's it! Now your project board will automatically stay up-to-date with new issues and pull requests, giving you a little time back to work on the fun parts of your project. 

Enjoy! ✨