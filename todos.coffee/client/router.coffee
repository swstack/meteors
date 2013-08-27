root = exports ? this

root.TodosRouter = Backbone.Router.extend(
  routes:
    ":list_id": "main"

  main: (list_id) ->
    oldList = Session.get("list_id")
    if oldList isnt list_id
      Session.set "list_id", list_id
      Session.set "tag_filter", null

  setList: (list_id) ->
    @navigate list_id, true
)
Router = new TodosRouter
Meteor.startup ->
  Backbone.history.start pushState: true