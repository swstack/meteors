class foo
    constructor: (bar) ->
        @bar = bar

    start: () ->
        Meteor.setInterval(@printSomething, 3000)

    printSomething: () =>
        console.log @bar
        @bar++

x = new foo 0
x.start()
