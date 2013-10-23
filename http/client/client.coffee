moarStuff = new Meteor.Collection "moarStuff"

Template.test.stuff = () ->
	return moarStuff.find()


tick = () ->
    console.log Meteor.absoluteUrl()
    console.log "fart factory"

Meteor.setInterval tick, 3000
