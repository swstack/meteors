# logger = TLog.getLogger()
# logger.setOptions(TLog.LOGLEVEL_MAX, true, true, true)

server = new Server
client = new Client


if Meteor.isServer
    Meteor.startup(server.start)

if Meteor.isClient
    Meteor.startup(client.start)
