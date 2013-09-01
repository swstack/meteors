# root = exports ? this


# class root.Publisher
#     constructor: (Lists, Todos) ->
#         # define some collections
#         # Lists = new Meteor.Collection "lists"
#         # Todos = new Meteor.Collection "todos"

#         # save them in array for iter by :method:publishAll
#         @collections = [\

#                 lists =
#                     name: "lists"
#                     self: Lists
#                     returnFn: () -> return Lists.find()

#                 todos =
#                     name: "todos"
#                     self: Todos
#                     returnFn: (list) -> return Todos.find({list: list})
#         ]

#     start: () ->
#         Log.info "Publisher starting..."
#         Log.info "...done."

#     # private
#     _publish:(name, ret) ->
#         Log.info "Publish... " + name
#         Meteor.publish name, ret

#     publish: (key) ->
#         # TODO: non-iterative search
#         for collection in @collections
#             if collection.name == key
#                 @_publish(collection.name, collection.returnFn)
#                 break

#     publishAll: () ->
#         for collection in @collections
#             @_publish(collection.name, collection.returnFn)

#     getCollection: (key) ->
#         # TODO: non-iterative search
#         for collection in @collections
#             if collection.name == key
#                 return collection.self
