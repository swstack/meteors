class Headers
    constructor: () ->
        @list = {}

    get: (header) =>
        # return header ? @list[header] : @list
        if header
            return @list[header]
        else
            return @list


Meteor.methods({
    getReqHeader: (header) ->
        return reqHeaders[header]

    getReqHeaders: () ->
        return reqHeaders
})

if (typeof WebApp != "undefined")
    app = WebApp.connectHandlers
else
    app = __meteor_bootstrap__.app

app.use (request, response, next) =>
    # Called on client connect
    reqHeaders = request.headers
    console.log reqHeaders
    return next()
