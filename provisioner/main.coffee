if Meteor.isServer
    # create app components and inject dependencies
    server = new Server

    # start
    server.start()

    # log completion of setup
    console.log "Server initialization complete."

if Meteor.isClient
    # create app components and inject dependencies
    user_manager = new UserManager
    wiki_manager = new WikiManager(user_manager)
    router = new WikiRouter(wiki_manager, user_manager)

    # development only, create debug page
    debug = new DebugPage(wiki_manager)
    debug.start()

    # start
    wiki_manager.start()
    router.start()

    # log completion of setup
    console.log "Client initialization complete."
