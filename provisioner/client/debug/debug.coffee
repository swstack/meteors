class @DebugPage
    constructor: (appDeps) ->
        #=======================================================================
        # Router constructor
        #=======================================================================
        @appDeps = appDeps

    start: () =>
        #=======================================================================
        # Start
        #=======================================================================
        Meteor.setInterval(@debugLoop, 3000)

        Router.map () ->
            this.route "debug", {
                path: "/debug"
                template: "debug"
            }

        @setupTemplates(@appDeps["client"],
                        @appDeps["router"])

    debugLoop: () =>
        client = @appDeps["client"]
        wikis = client.getWikis()

    setupTemplates: (client, router) =>
        Template.debug.wikis = () ->
            wikis = client.getWikis()
            return wikis

        Template.debug.users = () ->
            users = Meteor.users.find().fetch()
            console.log users
            return users
