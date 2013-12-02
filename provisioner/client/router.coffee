class @WikiRouter
    constructor: (wiki_manager, user_manager) ->
        #=======================================================================
        # Router constructor
        #=======================================================================
        @wiki_manager = wiki_manager
        @user_manager = user_manager

    start: () =>
        #=======================================================================
        # Start
        #=======================================================================
        Router.configure({
            layoutTemplate: "layout"
        })

        @mapRoutes()

        Hooks.onLoggedIn = () ->
            @onLoggedIn

        Hooks.onLoggedOut = () ->
            @onLoggedOut

        Hooks.init()        

    onLoggedIn: () =>
        Router.go(window.location.pathname)

    onLoggedOut: () =>
        Router.go(window.location.pathname)

    mapRoutes: () =>
        #=======================================================================
        # Closure for the router so it has a ref to ``wiki_manager``
        #=======================================================================
        wiki_manager = @wiki_manager
        user_manager = @user_manager
        self = this

        Router.map(() ->
            this.route("home", {
                path: "/wikis/:wiki_name"
                template: "wiki"

                action: () ->
                    wiki_name = this.params.wiki_name
                    has_rights = wiki_manager.hasRights(wiki_name)
                    if has_rights
                        console.log "Welcome to - " + wiki_name
                        this.render("wiki")
                        Session.set("current_wiki", wiki_name)
                    else
                        console.log "Not a valid wiki name - " + wiki_name
                        this.render("landing")
                        Router.go("landing")

                waitOn: () ->
                    return Meteor.subscribe("wikis")
                })

            this.route("create", {
                path: "/create"
                template: "create"
                action: () ->
                    loggedIn = user_manager.isLoggedIn()
                    if loggedIn
                        this.render("create")
                    else
                        Router.go("landing")
                        this.render("landing")
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
