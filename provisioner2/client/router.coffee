Router.configure({
    layoutTemplate: "layout"
})

Router.map ()->
    this.route "home", {
        path: "/"
        load: ()->
            console.log "load: home"

        before: [
            hook1 = () ->
                console.log "before: home"
                domain = Session.get("domain")
                if typeof domain == "undefined"
                    this.template = "loading"
                else if domain == null
                    this.template = "signup"
                else
                    this.template = "wiki"

        ]
    }
