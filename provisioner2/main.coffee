if Meteor.isServer
    server = new root.Server
    server.start()
    console.log "Server initialization complete."

if Meteor.isClient
    console.log "Client initialization complete."
