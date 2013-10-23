moarStuff = new Meteor.Collection "moarStuff"

Template.test.stuff = () ->
	return moarStuff.find()
	