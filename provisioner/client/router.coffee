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
                path: "/public/:wikiName"
                before: [
                    () ->
                        wikiName = this.params.wikiName
                        if client.isValidWiki(wikiName)
                            this.template = "wiki"
                        else
                            console.log "Not a valid wiki name - " + wikiName
                            Router.go("signUp")

                ]
            }
