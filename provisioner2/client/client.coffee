Meteor.startup ()->
    Meteor.call "getReqHeader", "host", (err, val)-> Session.set "host", val
