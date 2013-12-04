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

        @_mapRoutes()

        Hooks.onLoggedIn = () ->
            @_onLoggedIn

        Hooks.onLoggedOut = () ->
            @_onLoggedOut

        Hooks.init()        

    _onLoggedIn: () =>
        Router.go(window.location.pathname)

    _onLoggedOut: () =>
        Router.go(window.location.pathname)

    _mapRoutes: () =>
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

    navigate: (location, context) =>
        location = "/u/#{context}/#{location}" if context
        location = '/'+location if location.indexOf('/') != 0 #prevents calling route directly
        Router.go(location)

    evtNavigate: (evt) =>
        evt.preventDefault()
        if Session.get('editMode')
            Toast.warning('Save or Cancel changes before navigating away')
            return
        window.scrollTo(0,0)
        document.body.style.height = "" # restore bigger document from magicscroll

        $a = $(evt.target).closest('a')
        href = $a.attr('href')
        localhost = document.location.host
        linkhost = $a[0].host
        if localhost == linkhost
            # support for full local URLs (e.g. http://www.yourwiki.com/page <-- won't refresh)
            relHref = $('<a/>').attr( 'href', href )[0].pathname
            navigate(relHref)
        else
            window.open( href, '_blank')