if Meteor.isServer
    console.log "Starting server..."
    wikiDispatcher = new root.WikiDispatcher
    server = new root.Server wikiDispatcher
    server.start()

if Meteor.isClient
    console.log "Starting client..."
