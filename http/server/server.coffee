moarStuff = new Meteor.Collection "moarStuff"


class Headers
    constructor: () ->
        @list = {}

    get: (header) =>
        # return header ? @list[header] : @list
        if header
            return @list[header]
        else
            return @list


class Server
    constructor: (bar) ->
        @bar = bar

    start: () ->
        Meteor.setInterval(@tick, 3000)


    tick: () =>
    	exists = moarStuff.find({"value": @bar}).fetch()

    	if exists.length > 0
    		console.log(@bar + " already exists")
    	else
    		console.log ("inserting " + @bar)
	    	moarStuff.insert {"value": @bar}

	    @bar++

Meteor.methods({
    "getReqHeader": (header) ->
        return reqHeaders[header]

    "getReqHeaders": () ->
        return reqHeaders
})
# onConnect = () ->
#     console.log "Client connected: " + "farts"

# WebApp.connectHandlers.use onConnect

server = new Server 0
server.start()

# app = typeof WebApp != "undefined" ? WebApp.connectHandlers : __meteor_bootstrap__.app
if (typeof WebApp != "undefined")
    app = WebApp.connectHandlers
else
    app = __meteor_bootstrap__.app

app.use (request, response, next) =>
    # Called on client connect
    reqHeaders = request.headers
    console.log reqHeaders
    return next()
