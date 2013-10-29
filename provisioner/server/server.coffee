class root.WikiDispatcher
    constructor: () ->

    getWiki: (domain) =>
        return domain


class root.Server
    constructor: (wikiDispatcher) ->
        @wikiDispatcher = wikiDispatcher

    start: () ->
        # setup onClientConnect callback
        if (typeof WebApp != "undefined")
            app = WebApp.connectHandlers
        else
            app = __meteor_bootstrap__.app
        app.use (request, response, next) =>
            @onClientConnect request, response, next

    onClientConnect: (request, response, next) =>
        # Called on client connect
        reqHeaders = request.headers
        wiki = @wikiDispatcher.getWiki reqHeaders.host
        return next()
