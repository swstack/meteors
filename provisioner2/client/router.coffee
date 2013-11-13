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

    mapRoutes: (client) =>
        #=======================================================================
        # Closure for the router so it has a ref to ``client``
        #=======================================================================
        Router.map () ->
            this.route "signUp", {
                path: "/"
                template: "signup"
            }

            this.route "home", {
                path: "/:wikiName"
                before: [
                    () ->
                        if client.isValidWiki(this.params.wikiName)
                            this.template = "wiki"
                        else
                            console.log "Not a valid wiki name"
                            Router.go("signUp")

                ]
            }
