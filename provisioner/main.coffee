Things = new Meteor.Collection "things"


Meteor.publish "things", () ->
    return Things.find()

tickVal = 0

tick = () ->
    exists = Things.find({tickVal: tickVal}).fetch().length > 0

    if exists
        Log.info tickVal + " already exists."
    else
        Log.info tickVal + " made."
        row =
            tickVal: tickVal
        Things.insert row
    tickVal = tickVal + 1


Meteor.setInterval tick, 3000



