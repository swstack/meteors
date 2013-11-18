if Meteor.isServer
    # create app components and inject dependencies
    server = new Server

    # start
    server.start()

    # log completion of setup
    console.log "Server initialization complete."

if Meteor.isClient
    # create app components and inject dependencies
    client = new Client
    router = new WikiRouter(client)

    # development only, create debug page
    debugDeps = {
        "client": client,
        "router": router,
    }
    debug = new DebugPage(debugDeps)
    debug.start()

    # start
    client.start()
    router.start()

    # log completion of setup
    console.log "Client initialization complete."
