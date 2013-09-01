Meteor.subscribe "things"
Things = new Meteor.Collection "things"

Template.things.things = () ->
    return Things.find().fetch()
    # return Things.find().fetch()
    # return Players.find({}, {sort: {score: -1, name: 1}});