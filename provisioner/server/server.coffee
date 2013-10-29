class root.Headers
    constructor: () ->
        @list = {}

    get: (header) =>
        # return header ? @list[header] : @list
        if header
            return @list[header]
        else
            return @list


class root.WikiDispatcher
    constructor: () ->

    getWiki: (domain) =>
        console.log domain


class root.Server
    constructor: (wikiDispatcher) ->
        @wikiDispatcher = wikiDispatcher
        @tick_counter = 0

    start: () ->
        # setup onClientConnect callback
        if (typeof WebApp != "undefined")
            app = WebApp.connectHandlers
        else
            app = __meteor_bootstrap__.app
        app.use (request, response, next) =>
            @onClientConnect request, response, next

        # start arbitrary debug tick interval
        Meteor.setInterval(@tick, 3000)

    tick: () =>
        console.log "Tick... " + @tick_counter
        @tick_counter++

    onClientConnect: (request, response, next) =>
        # Called on client connect
        reqHeaders = request.headers
        wiki = @wikiDispatcher.getWiki reqHeaders.host
        return next()


Meteor.methods({
    "getReqHeader": (header) ->
        return reqHeaders[header]

    "getReqHeaders": () ->
        return reqHeaders
})
