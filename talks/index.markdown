---
layout: page
title: Talks
comments: false
sharing: false
sidebar: false
footer: true
---

<div class="projects">
  <div class="project" id="GoWin">
    <div class="title">
        <a href="/talk/devex/gowin/">
            <img src="/images/gopher-plane.png" alt="Gopher Sky Writer Plane" title="Gopher Windows"/>
            Gopher Windows: Beyond Cross-Compiling
        </a>
    </div>
    <div class="locations">GopherCon 2016</div>
    <p class="description">
      You may not realize it but there are a lot of Windows developers moving into your neighborhood.
      They are using and contributing to open source projects, even those that aren't just for Windows.
      But here's the rub: Often tools are written Unix first", shoehorning Windows support in later.
      This approach can shut out potential users.
    </p>
    <p class="description">
      Lucky for us, Go has strong support for cross-platform development. So let's start writing cross-platform first and welcome our Windows
      neighbors. Learn some of the Windows quirks that you should take into account, and the Go goodies to help you conquer them.
    </p>
    <iframe width="560" height="315" src="https://www.youtube.com/embed/UOeeR7odY1I" frameborder="0" allowfullscreen style="width: 560; margin-right: auto; margin-left: auto;display:block;"></iframe>
  </div>
  <div class="project" id="ThinkOutsideTheContainer">
    <div class="title">
        <a href="/talk/carina/think-outside-the-container/#/howtowhale">
            <img src="{{root_url}}/images/whale-dream.png" alt="Whale" title="Learning How to Whale"/>
            Think Outside the Container: Learning How to Whale
        </a>
    </div>
    <div class="locations">OSCON Austin 2016</div>
    <p class="description">
      There is much more to Docker than just deploying your flagship application. Carolyn VanSlyck, Ash Wilson, and Nick Silkey look at three use cases for Docker that go beyond the typical software development pipeline:
    </p>
    <ol class="description">
      <li>The Rackspace Cloud DNS product team is running a Hubot-based ChatOps bot on Carina to automate routine operational tasks in the open via a team-based chat. The team successfully migrated this service from another provider into Carina in under an hour from start to finish, including a datastore migration. (Nick Silkey @ 2:55)</li>

      <li>Rackspace’s developer documentation is open to external contributors and has streamlined the editing process with a staging environment that previews the full site on-demand for pull requests. All of its infrastructure is hosted within Docker containers, managed by Ansible, on a CoreOS cluster. (Ash Wilson @ 13:57)</li>

      <li style="font-weight: bold">How to Whale is teaching Docker with zero setup from the comfort of your web browser. Every user has an interactive sandbox, courtesy of JupyterHub, which spins up a Jupyter server on the user’s own Docker Swarm cluster. (Carolyn Van Slyck @ 24:32)</li>
    </ol>
    <p class="description">
      You’ll leave knowing how you can use Docker on the side, even if you haven’t tackled Dockerizing your application.
    </p>

    <iframe width="560" height="315" src="https://www.youtube.com/embed/B9bAWsCslqg" frameborder="0" allowfullscreen style="width: 560; margin-right: auto; margin-left: auto;display:block;"></iframe>
  </div>
  <div class="project" id="JupyterHubCarina">
      <div class="title">
          <a href="/talk/carina/jupyterhub/">
              <img src="{{root_url}}/images/jupyter-icon.png" alt="Jupyter Logo" title="Running JupyterHub on Carina"/>
              Running JupyterHub on Carina
          </a>
      </div>
      <div class="locations">PyData Chicago Meetup</div>
      <p class="description">
        Jupyter is an exciting tool, empowering you to quickly dive into the fun parts of whatever problem you are solving. With it, you can do so much more than just your research. By combining JupyterHub with Carina, you have a learning platform, perfect for leading a workshop, trying a new language or just playing around with code. It provides push button user notebooks, where each user is not only isolated from others, but they are running on their own compute resources and can hit the "reset" button at any time to start fresh.</p>
      <p class="description">
        Learn how <a href="http://howtowhale.com">howtowhale.com</a> uses JupyterHub and Carina to teach Docker, with zero setup and immediate results. With these essential building blocks, you too can create the ultimate learning environment.</p>
  </div>
  <div class="project" id="IntroductionToCarina">
      <div class="title">
          <a href="/talk/carina/lightning/">
              <img src="{{root_url}}/images/carina.png" alt="Carina Logo" title="An Introduction to Carina"/>
              An Introduction to Carina
          </a>
      </div>
      <div class="locations">DevOps Chicago Meetup, ChicagoRuby Meetup</div>
      <p class="description">A lightning fast introduction to Carina by Rackspace, which provides Docker Containers as a Service. Learn how to "think above the whale" and start <em>doing the Dockers</em> in just a few easy commands.</p>

      <iframe src="https://player.vimeo.com/video/162183519?color=ff9933&title=0&byline=0&portrait=0" width="640" height="360" frameborder="0" allowfullscreen style="width: 560; margin-right: auto; margin-left: auto;display:block;"></iframe>
  </div>
</div>
