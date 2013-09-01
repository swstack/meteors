# root = exports ? this

# class root.TodosRouter extends Backbone.Router
#     routes:
#         ":list_id": "main"

#     main: (list_id) ->
#         oldList = Session.get("list_id")
#         if oldList isnt list_id
#             Session.set "list_id", list_id
#             Session.set "tag_filter", null

#     setList: (list_id) ->
#         @navigate list_id, true

# Meteor.startup ->
#     Backbone.history.start pushState: true
