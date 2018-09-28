---
categories:
- docker
- jupyter
comments: true
date: "2016-03-16T00:00:00Z"
title: Use Docker optimized Jupyter Stacks with JupyterHub
---

Jupyter is a crazy awesome. Head over to [tmpnb.org](http://tmpnb.org) to try it out. _waits_
Have fun playing with Python? Or did you maybe learn yourself a Haskell for great good?
Hopefully it's obvious that Jupyter is not only a cool concept, but a pretty damn powerful one too.

I've been digging into JupyterHub lately, specifically toying with running it on [Carina](http://getcarina.com)
because I like to Docker _ALL THE THINGS_! By pairing them up, when a user logs into the Jupyter hub,
a Carina cluster is created on-the-fly to run that user's personal Jupyter server.
It's Jupyter + bring your own compute.

[Jupyter Stacks](https://github.com/jupyter/docker-stacks) are opinionated stacks of
ready-to-run Jupyter applications in Docker, and are useful when you want to use
bare minimum necessary to run a notebook (hint: minimal-notebook) or grab something off-the-shelf
for a particular language. Here's how you can build a Docker image based on a Jupyter Stack that works with JupyterHub:

1. Pick the stack that you would like to use, such as `minimal-notebook`.

2. Make a Dockerfile with the following contents. Replace `<stack>` with
    the name of your Jupyter Stack.


        FROM jupyter/<stack>

        # Setup the JupyterHub single user entrypoint
        USER root
        RUN wget -q https://raw.githubusercontent.com/jupyter/jupyterhub/master/scripts/jupyterhub-singleuser -O /usr/local/bin/jupyterhub-singleuser && \
            chmod 755 /usr/local/bin/jupyterhub-singleuser && \
            mkdir -p /srv/singleuser/ && \
            wget -q https://raw.githubusercontent.com/jupyter/dockerspawner/master/singleuser/singleuser.sh -O /srv/singleuser/singleuser.sh && \
            chmod 755 /srv/singleuser/singleuser.sh

        # Verify that the JupyterHub entrypoint works
        USER jovyan
        RUN sh /srv/singleuser/singleuser.sh -h

        # Configure the JupyterHub entrypoint
        CMD ["sh", "/srv/singleuser/singleuser.sh"]

    **Note**: The black magic voodoo is copied from [Jupyter/DockerSpawner's singleuser Dockerfile](https://github.com/jupyter/dockerspawner/blob/master/singleuser/Dockerfile)
    and hopefully shouldn't change often enough to matter.

3. Connect to your docker host and run the following commands. Replace `<docker-hub-user>`
    with your Docker Hub username and `<stack>` with the name of your Jupyter Stack.

        docker build -t <docker-hub-user>/<stack> .
        docker push <docker-hub-user>/<stack>

4. Update your JupyterHub configuration to use your custom Docker image when
    it creates user servers:

    **jupyter-config.py**

        import os

        c = get_config()
        c.DockerSpawner.container_image = "<docker-hub-user>/<stack>"
        # ... Do the rest of your usual configuration
