Wikis = new Meteor.Collection()


Router.configure({
    layoutTemplate: "layout"
})


Router.map () ->
    this.route "home", {
        path: "/"
        load: () ->
            # this.template = getPage(Session.get("host"))

        before: [
            () ->
                this.template = getPage(Session.get("host"))
        ]
    }

getPage = (host) ->
    if typeof host == "undefined"
        return "loading"
    else
        subdomain = getSubDomain(host)
        loggedIn = Meteor.user()
        if subdomain and loggedIn
            return "wiki"
        else
            return "signup"

getSubDomain = (host) ->
    chunks = host.split(".")
    if chunks.length > 2
        subdomain = chunks[0]
        if isValidWiki(subdomain)
            return subdomain

    return null



isValidWiki = (subdomain) ->
    return false
