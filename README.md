Basic Website
=============

This repo contains a simple layout that could be use to build a static website
using the popular tool Jekyll.

The one requirement is that you have Docker installed, nothing else is required.

You build the container which you can then use to serve the site while you design
it. Once finished, build the container once more and deploy it.

Usage
-----

To start with build the container image using docker, like so:

    $ git clone https://github.com/bugthing/contained-jekyll-site.git
    $ cd ./contained-jekyll-site/
    $ docker build -t thin-site .

You can use the container to develop the jekyll base site. We can mount the
current directory inside the container as we start it. This means changes to
files in current directory will be served by the webserver running in the container.
You can fire up the container and then edit site as need like so:

    $ docker run -it --rm -v `pwd`:/usr/src/app -p 4000:4000 thin-site bundle exec jekyll serve --host=0.0.0.0

Visit http://0.0.0.0:4000 in a browser, edit some of the content, reload and 

Once happy with the site, build it again and serve via the container like so:

    $ docker build -t thin-site .
    $ docker run -it --rm --name thin -p 4000:80 thin-site
