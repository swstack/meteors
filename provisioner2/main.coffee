if Meteor.isServer
    server = new Server
    server.start()
    console.log "Server initialization complete."

if Meteor.isClient
    client = new Client
    router = new WikiRouter(client)
    client.start()
    router.start()
    console.log "Client initialization complete."
