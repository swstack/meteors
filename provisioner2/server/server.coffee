class root.Server
    constructor: () ->
        @reqHeaders = null

    start: () ->
        # setup onClientConnect callback
        if (typeof WebApp != "undefined")
            app = WebApp.connectHandlers
        else
            app = __meteor_bootstrap__.app
        app.use (request, response, next) =>
            @onClientConnect request, response, next

        Meteor.methods({
            getReqHeaders: @getReqHeaders
            getReqHeader: @getReqHeader
            getDomain: @getDomain
        })

    onClientConnect: (request, response, next) =>
        # Called on client connect
        @reqHeaders = request.headers
        return next()

    getDomain: () =>
        chunks = @reqHeaders.host.split(".")
        if chunks.length > 2
            return chunks[0]
        else
            return null
        return @reqHeaders.host

    getReqHeaders: () =>
        return @reqHeaders

    getReqHeader:(header) =>
        return @reqHeader[header]
