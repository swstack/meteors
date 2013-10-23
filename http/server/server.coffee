moarStuff = new Meteor.Collection "moarStuff"

class foo
    constructor: (bar) ->
        @bar = bar

    start: () ->
        Meteor.setInterval(@doSomething, 3000)


    doSomething: () =>
    	exists = moarStuff.find({"value": @bar}).fetch()

    	if exists.length > 0
    		console.log(@bar + " already exists")
    	else
    		console.log ("inserting " + @bar)
	    	moarStuff.insert {"value": @bar}

	    @bar++

x = new foo 0
x.start()
