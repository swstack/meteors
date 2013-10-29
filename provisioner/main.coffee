if Meteor.isServer
    wikiDispatcher = new root.WikiDispatcher
    server = new root.Server wikiDispatcher
    server.start()
    console.log "Server initialization complete."

if Meteor.isClient
    console.log "Client initialization complete."
