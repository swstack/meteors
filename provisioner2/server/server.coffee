Wikis = new Meteor.Collection("wikis")


class @Server
    constructor: () ->
        #=======================================================================
        # Server constructor
        #=======================================================================
        @reqHeaders = null

    start: () =>
        #=======================================================================
        # Start
        #=======================================================================
        if (typeof WebApp != "undefined")
            app = WebApp.connectHandlers
        else
            app = __meteor_bootstrap__.app
        app.use (request, response, next) =>
            @_onClientConnect request, response, next

        Meteor.methods({
            getReqHeaders: @getReqHeaders
            getReqHeader: @getReqHeader
        })

    _onClientConnect: (request, response, next) =>
        #=======================================================================
        # Called on client connect
        #=======================================================================
        @reqHeaders = request.headers
        return next()

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
