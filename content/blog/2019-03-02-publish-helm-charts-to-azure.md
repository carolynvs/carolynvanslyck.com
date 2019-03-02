---
comments: false
date: "2019-03-02"
title: Publish Helm Charts to Azure Storage
slug: publish-helm-charts-to-azure
description: Publish Helm charts to Azure Storage during your CI build
image: images/azure-gophers.png
---

I'd like to share my magic script, passed down from repo to repo, for publishing
Helm charts to Azure storage during a CI build. I've used this most recently for
the [Athens project](https://docs.gomods.io), but it has made an appearance with
[Minibroker](https://github.com/osbkit/minibroker), and nearly everything I've
worked on with a Helm chart lately.

Just last night I was seriously considering rolling it into my [tiny azure
cli][tiny-az] so that it didn't _need_ to be a script at all. But a girl's gotta
blog, so here's the magic steps for making this work on your next project!

<figure style="text-align: center; margin: 5px">
  <img src="/images/azure-gophers.png" width="500" alt="Gophers on the Azure Logo" />
  <figcaption>
    pew! pew!
  </figcaption>
</figure>

1. Get a [free Azure account](https://azure.microsoft.com/en-us/free/). 💰

1. Create a **blob** [storage account][create-blob-storage].

1. [Create a public container][create-container] in the storage account named `charts`.

1. Copy the **Connection String** for the account, it will look like this
   `DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=myaccountkey;EndpointSuffix=core.windows.net`.

1. Log into your CI system, for example Travis CI, and create a
   sensitive/private environment variable named
   `AZURE_STORAGE_CONNECTION_STRING`, then for the value use the **quoted**
   connection string from the previous step. Putting quotes around this value is
   VERY IMPORTANT*. It should look like this
   `AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol...EndpointSuffix=core.windows.net"`.

    \* If this environment variable isn't defined and formatted with quotes
   _just right_, you will see the follow error at the very end, and waste lots
   of time like me, `Error: AZURE_STORAGE_ACCOUNT and AZURE_STORAGE_ACCESS_KEY
   or AZURE_STORAGE_CONNECTION_STRING must be set`.

1. Here is the magic script that I mentioned earlier. Copy that into your
   repository, into `scripts/publish-charts.sh` and run `chmod +x` on it.

    <script src="https://gist.github.com/carolynvs/e675b5e6a4d29f22993f92ab7241879a.js"></script>

    The script handles the first run scenario, where the container is empty. It
    will create a new index.yaml file and upload it, along with the compressed
    chart files. When an index.yaml already exists, it is downloaded and merged,
    preserving older versions.

1. This script relies on two CLIs being installed: helm and the az cli
   ([tiny][tiny-az] or [official][az-cli]). I prefer to use a build image
   container, rather than mess with installing directly on the build server.
   This lets me test my build scripts locally. I put this file in
   `scripts/build-image/Dockerfile`.

    <script src="https://gist.github.com/carolynvs/2bb79c20097e54199c6077696175c562.js"></script>

1. Here are the commands to build the container, and execute the push-charts
   script. It mounts the root of the repository into the container, passes along
   the `AZURE_STORAGE_CONNECTION_STRING` environment variable and runs
   push-charts.sh inside of our build-image container.

    <script src="https://gist.github.com/carolynvs/513b91caadaa1dbb2fd8bde24496e976.js"></script>

Now your builds will publish your charts and an index of all your chart versions
to https://CONTAINER.blob.core.windows.net/charts.

Here's what it looks like from the user's perspective:

```output 
$ helm repo add gomods https://athens.blob.core.windows.net/charts
"gomods" has been added to your repositories

$ helm search athens-proxy
NAME               	CHART VERSION	APP VERSION	DESCRIPTION
gomods/athens-proxy	0.2.0        	0.2.0      	The proxy server for Go modules
```

It is a bit of glue, but it does work. Sometimes I'm asked why I do this
instead of hosting on Chart Museum or some other solution. Mostly because I like
static file storage because it's not something that requires "opsing" down the road. I
don't have to keep a service up or secured which is good because that isn't
something I enjoy or am good at. 😅

Maybe in a week or six months, I'll replace this with a tiny go binary. We can
only hope!

[tiny-az]: https://github.com/carolynvs/az-cli
[az-cli]:
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
[create-storage-account]:
https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal
[create-blob-storage]:
https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal
[create-container]:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal#create-a-container
