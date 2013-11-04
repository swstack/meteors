# # # Get the domain for this HTTP request
# #############################################


# Router.configure({
#     layoutTemplate: "layout"
# })

# Router.map ()->
#     this.route "home", {
#         path: "/"
#         where: "server"
#         load: ()->
#             console.log "onload: home"

#         before: [
#             hook1 = () ->
#                 chunks = this.request.headers.host.split(".")
#                 if chunks.length > 2
#                     domain = chunks[0]
#                 else
#                     domain = null

#                 if domain = null
#                     console.log "signup page"
                    
#                 else
#                     console.log "wiki"
#                     # this.response.write Handlebars.templates["wiki"]()
#         ]
#     }
