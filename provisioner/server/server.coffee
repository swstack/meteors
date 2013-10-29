knownWikis =
    "humonwiki.com": "humonwiki.com"
    "foo.humonwiki.com": "foo.humonwiki.com"
    "bar.humonwiki.com": "bar.humonwiki.com"

class root.WikiDispatcher
    constructor: () ->

    dispatch: (domain) =>
        if domain == "humonwiki.com"
            @renderSignUpPage()
        else
            @renderWiki()

    renderSignUpPage: ()=>
        console.log Meteor
        Meteor.render ()=>
            Template.signup()

    renderWiki: ()=>
        Meteor.render ()=>
            Tempate.wiki()

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
        @wikiDispatcher.dispatch reqHeaders.host
        return next()
