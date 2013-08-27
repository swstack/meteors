root = exports ? this

class root.Publisher
    constructor: () ->
        # define some collections
        Lists = new Meteor.Collection "lists"
        Todos = new Meteor.Collection "todos"

        # save them in array for iter by :method:publishAll
        @collections = [\

                lists =
                    name: "lists"
                    returnFn: () -> return Lists.find()

                todos =
                    name: "todos"
                    returnFn: (list) -> return Todos.find({list: list})
        ]
        
    start: () ->
        Log.info "Publisher starting..."
        Log.info "...done."

    _publish:(name, ret) ->
        Log.info "Publish... " + name
        Meteor.publish name, ret

    publish: (key) ->
        for collection in @collections
            if collection.name == key
                @_publish(collection.name, collection.returnFn)
                break

    publishAll: () ->
        for collection in @collections
            Log.info " - " + collection.name
            @_publish(collection.name, collection.returnFn)
