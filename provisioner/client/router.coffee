class @WikiRouter
    constructor: (client) ->
        #=======================================================================
        # Router constructor
        #=======================================================================
        @client = client

    start: () =>
        #=======================================================================
        # Start
        #=======================================================================
        Router.configure({
            layoutTemplate: "layout"
        })

        @mapRoutes(@client)

        Hooks.onLoggedIn = () ->
            @onLoggedIn

        Hooks.onLoggedOut = () ->
            @onLoggedOut

        Hooks.init()

    onLoggedIn: () =>
        Router.go(window.location.pathname)

    onLoggedOut: () =>
        Router.go(window.location.pathname)

    mapRoutes: (client) =>
        #=======================================================================
        # Closure for the router so it has a ref to ``client``
        #=======================================================================
        Router.map(() ->
            this.route("home", {
                path: "/wikis/:wikiName"
                template: "wiki"
                action: () ->
                    wikiName = this.params.wikiName
                    if client.isValidWiki(wikiName)
                        console.log "Welcome to - " + wikiName
                        this.render("wiki")
                    else
                        console.log "Not a valid wiki name - " + wikiName
                        this.render("signup")
                        Router.go("signUp")
                })

            this.route("create", {
                path: "/create"
                template: "create"
                })

            this.route("dashboard", {
                path: "/dashboard"
                template: "dashboard"
                action: () ->
                    if Meteor.userId()
                        this.render("dashboard")
                    else
                        this.render("landing")
                        Router.go("landing")
                })

            this.route("landing", {
                path: "/landing"
                template: "landing"
                action: () ->
                    if Meteor.userId()
                        this.render("dashboard")
                        Router.go("dashboard")
                    else
                        this.render("landing")
                })

            this.route("wildcard", {
                path: "*"
                action: () ->
                    this.render("landing")
                    Router.go("landing")
                })
        )
