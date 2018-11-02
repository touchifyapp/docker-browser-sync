# Supported tags and respective Dockerfile links

*  [`2.26.3`, `2.26`, `2`, `latest` (Dockerfile)](https://github.com/touchifyapp/docker-browser-sync/blob/master/Dockerfile)

This image is updated via [pull requests to the `touchifyapp/docker-browser-sync` GitHub repo](https://github.com/touchifyapp/docker-browser-sync/pulls).

# [Browsersync](http://http://browsersync.io): Keep multiple browsers & devices in sync when building websites.

![Browsersync logo](https://raw.githubusercontent.com/BrowserSync/browsersync.github.io/master/public/img/logo-gh.png)

`Browsersync` keeps multiple browsers & devices in sync when building websites.

## How to use

The basic Browser Sync examples translated are the exact same commands with the docker command prefixing it.

### Static websites

The following case publishes port 3000 and port 3001 so you can use the static server and configure Browser Sync as always.

```
$ docker run -dt \
$   --name browser-sync \
$   -p 3000:3000 \
$   -p 3001:3001 \
$   -v $(PWD):/source \
$   touchifyapp/browser-sync \
$   start --server --files "css/*.css"
```

### Dynamic websites

In this case, you have to let Docker know how to resolve the host you are proxying to. There are a couple of ways to do this so we'll go one by one.

#### Link

A docker link is a one-way connection between two containers. Order matters so you have to first start your app and then link Browser Sync to it:

```
# Run your app
$ docker run -dt --name myapp -p 8000:8000 myimage

# Run Browsersync as a proxy
$ docker run -dt \
$   --name browser-sync \
$   --link myapp \
$   -p 3000:3000 \
$   -p 3001:3001 \
$   touchifyapp/browser-sync \
$   start --proxy "myapp:8000" --files "css/*.css"
```

#### Custom network

A docker network is a connection between multiple containers. Unlike links, order does not matter so it is a more robust solution, but it requires setting up the network before running the containers.

```
# Create the network (one-time)
$ docker network create mynetwork

# Run your app
$ docker run -dt --name myapp --net mynetwork myimage

# Run Browsersync as a proxy
$ docker run -dt \
$   --name browser-sync \
$   --net mynetwork \
$   -p 3000:3000 \
$   -p 3001:3001 \
$   touchifyapp/browser-sync \
$   start --proxy "myapp:8000" --files "css/*.css"
```

### Config file

Since the image exposes Browser Sync's CLI as is, you can use a config file as well.

```
$ docker run -dt \
$   --name browser-sync \
$   -p 3000:3000 \
$   -p 3001:3001 \
$   -v $(PWD)/bs-config.js:/source/bs-config.js \
$   touchifyapp/browser-sync \
$   start --config bs-config.js
```

## Command line options

```
-server, -s             Run a Local server (uses your cwd as the web root)
--cwd                   Working directory
--json                  If true, certain logs will output as json only
--serveStatic, --ss     Directories to serve static files from
--port                  Specify a port to use
--proxy, -p             Proxy an existing server
--ws                    Proxy mode only - enable websocket proxying
--browser, -b           Choose which browser should be auto-opened
--watch, -w             Watch files
--ignore                Ignore patterns for file watchers
--files, -f             File paths to watch
--index	Specify         which file should be used as the index page
--plugins               Load Browsersync plugins
--extensions            Specify file extension fallbacks
--startPath             Specify the start path for the opened browser
--single                If true, the connect-history-api-fallback middleware will be added
--https                 Enable SSL for local development
--directory             Show a directory listing for the server
--xip                   Use xip.io domain routing
--tunnel                Use a public URL
--open                  Choose which URL is auto-opened (local, external or tunnel), or provide a url
--cors                  Add Access Control headers to every request
--config, -c            Specify a path to a configuration file
--host                  Specify a hostname to use
--logLevel              Set the logger output level (silent, info or debug)
--reload-delay          Time in milliseconds to delay the reload event following file changes
--reload-debounce       Restrict the frequency in which browser:reload events can be emitted to connected clients
--ui-port               Specify a port for the UI to use
--watchEvents           Specify which file events to respond to
--no-notify             Disable the notify element in browsers
--no-open               Don't open a new browser window
--no-online             Force offline usage
--no-ui                 Don't start the user interface
--no-ghost-mode         Disable Ghost Mode
--no-inject-changes     Reload on every file change
--no-reload-on-restart  Don't auto-reload all browsers following a restart
```

## License

View [license information](https://github.com/touchifyapp/docker-browser-sync/blob/master/LICENSE) for the software contained in this image.

## Supported Docker versions

This image is officially supported on Docker version 1.12+.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

## User Feedback

### Documentation

Documentation for this image is stored in [the `touchifyapp/docker-browser-sync` GitHub repo](https://github.com/touchifyapp/docker-browser-sync).
Be sure to familiarize yourself with the repository's README.md file before attempting a pull request.

### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/touchifyapp/docker-browser-sync/issues).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/touchifyapp/docker-browser-sync/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.