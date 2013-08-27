root = exports ? this

class root.Database
    constructor: (@publisher) ->
        
        
    start: () ->
        Log.info "Database starting..."
        @publisher.publishAll()
        Log.info "...done."
