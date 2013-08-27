
if Meteor.isServer
    publisher = new Publisher
    publisher.start()

    db = new Database publisher
    db.start()
