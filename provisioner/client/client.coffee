headersCallback = (headers) ->
	console.log headers

Meteor.call("getReqHeaders", headersCallback)
