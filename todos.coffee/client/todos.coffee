# Client-side JavaScript, bundled and sent to client.

Router = new TodosRouter

# Meteor.startup () ->
#     Backbone.history.start pushState: true

# Define Minimongo collections to match server/publish.js.
Lists = new Meteor.Collection "lists"
Todos = new Meteor.Collection "todos"

# ID of currently selected list
Session.setDefault 'list_id', null

# Name of currently selected tag for filtering
Session.setDefault 'tag_filter', null

# When adding tag to a todo, ID of the todo
Session.setDefault 'editing_addtag', null

# When editing a list name, ID of the list
Session.setDefault 'editing_listname', null

# When editing todo text, ID of the todo
Session.setDefault 'editing_itemname', null

listsHandle = Meteor.subscribe 'lists', () ->
    Log.info "..sub lists.."
    if !Session.get 'list_id'
        list = Lists.findOne {}, sort: name: 1
        if list
            Router.setList list._id
