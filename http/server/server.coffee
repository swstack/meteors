console.log ("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||")
console.log Meteor.absoluteUrl()
console.log WebApp.httpServer.domain

i = 0

tmp = () ->
    i += 1
    console.log i

Meteor.setInterval tmp, 1000
