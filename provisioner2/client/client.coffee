Meteor.startup ()->
    Meteor.call "getDomain", (err, val)-> Session.set "domain", val
