domain = null


domainCallback = (err, result) ->
	console.log result

Meteor.call("getDomain", domainCallback)
