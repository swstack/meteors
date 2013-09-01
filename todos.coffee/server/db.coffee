# root = exports ? this

# class root.Database
#     constructor: (@publisher) ->

#     start: () ->
#         Log.info "Database starting..."
#         @publisher.publishAll()
#         @_bootstrap()
#         Log.info "...done."

#     _bootstrap: () ->
#         Lists = @publisher.getCollection("lists")
#         if Lists.find().count() == 0
#             newLists = [
#                 list1 = 
#                       name:
#                         "Meteor Principles"
#                       contents: [
#                              ["Data on the Wire", "Simplicity", "Better UX", "Fun"],
#                              ["One Language", "Simplicity", "Fun"],
#                              ["Database Everywhere", "Simplicity"],
#                              ["Latency Compensation", "Better UX"],
#                              ["Full Stack Reactivity", "Better UX", "Fun"],
#                              ["Embrace the Ecosystem", "Fun"],
#                              ["Simplicity Equals Productivity", "Simplicity", "Fun"]
#                        ]
     
#                 list2 = 
#                       name:
#                         "Languages"
#                       contents: [
#                          ["Lisp", "GC"],
#                          ["C", "Linked"],
#                          ["C++", "Objects", "Linked"],
#                          ["Python", "GC", "Objects"],
#                          ["Ruby", "GC", "Objects"],
#                          ["JavaScript", "GC", "Objects"],
#                          ["Scala", "GC", "Objects"],
#                          ["Erlang", "GC"],
#                          ["6502 Assembly", "Linked"]
#                          ]

#                 list3 =
#                       name:
#                         "Favorite Scientists"
#                       contents: [
#                          ["Ada Lovelace", "Computer Science"],
#                          ["Grace Hopper", "Computer Science"],
#                          ["Marie Curie", "Physics", "Chemistry"],
#                          ["Carl Friedrich Gauss", "Math", "Physics"],
#                          ["Nikola Tesla", "Physics"],
#                          ["Claude Shannon", "Math", "Computer Science"]
#                        ]
#             ]

#             timestamp = new Date().getTime()
#             Todos = @publisher.getCollection("todos")

#             for list in newLists
#                 list_id = Lists.insert({name: list.name})
#                 for content in list.contents
#                     Todos.insert(
#                             content =
#                                 list_id: list_id
#                                 text: content[0]
#                                 timestamp: timestamp
#                                 tags: content.slice(1)
#                         )
#                     timestamp += 1  # ensure unique timestamp
