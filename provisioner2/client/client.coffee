root = exports ? this


Meteor.startup ()->
    Meteor.call "getReqHeader", "host", (err, val)-> Session.set "host", val


class root.Client
    constructor: () ->
        #=======================================================================
        # Client constructor
        #=======================================================================
        

    start: () ->
    	#=======================================================================
        # Start
        #=======================================================================
        Template.signup.events = {
        	"click #login-button": @onSignUp
        }

    onSignUp: (event, template) =>
        #=======================================================================
        # Event: onSignUp
        #
        # We need to h
        #=======================================================================
        wiki = document.getElementById("signup-wiki").value
        email = document.getElementById("signup-email").value
        pw = document.getElementById("signup-password").value

        # do validation on password, email and wiki

        Accounts.createUser({
            email: email
            password: pw
            }, (err)->
                console.log err)

        console.log "wtf"
        # Meteor.call("attemptSignup", wiki, email, pw)
