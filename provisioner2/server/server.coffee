root = exports ? this

Wikis = new Meteor.Collection("wikis")


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
            attemptSignup: @attemptSignup
        })

    onClientConnect: (request, response, next) =>
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

    attemptSignup: (wiki, username, password) =>
        Accounts.createUser({
            username: username
            password: password
            })
        console.log "sup"
        if Wikis.findOne({name: wiki})
            console.log "Wiki already exists"
        else
            Wikis.insert({name: wiki})
