if Meteor.isServer
    server = new Server
    server.start()
    console.log "Server initialization complete."

if Meteor.isClient
    client = new Client
    client.start()
    console.log "Client initialization complete."
