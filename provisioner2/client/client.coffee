Wikis = new Meteor.Collection()


class @Client
    constructor: () ->
        #=======================================================================
        # Client constructor
        #=======================================================================
        

    start: () =>
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
        password = document.getElementById("signup-password").value

        # do validation on email/password and wiki
        if Wikis.findOne({name: wiki})
            console.log "Wiki already exists"
            Router.go("signUp")
        else
            Wikis.insert({name: wiki})

        # sign them up
        Accounts.createUser({
            email: email
            password: password
        }, (err) ->
            console.log err
        )

        # send them to the new wiki
        Router.go("/" + wiki)

    isValidWiki: (wiki_name) =>
        if Wikis.findOne({name: wiki_name})
            return true
        else
            return false