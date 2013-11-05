root = exports ? this

class root.Server
    constructor: () ->
        #=======================================================================
        # Server constructor
        #=======================================================================
        @reqHeaders = null

    start: () ->
        #=======================================================================
        # Start
        #=======================================================================
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
        #=======================================================================
        # Called on client connect
        #=======================================================================
        @reqHeaders = request.headers
        return next()

    # getDomain: () =>
    #     #=======================================================================
    #     # Return a valid domain if any
    #     #=======================================================================
    #     domain = @reqHeaders.host.split(".")
    #     if chunks.length > 2
    #         return chunks[0]
    #     else
    #         return null
    #     return @reqHeaders.host

    getReqHeaders: () =>
        #=======================================================================
        # Get all headers
        #=======================================================================
        return @reqHeaders

    getReqHeader: (header) =>
        #=======================================================================
        # Get specific header
        #=======================================================================
        return @reqHeaders[header]
