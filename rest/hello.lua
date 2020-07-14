local restserver = require("restserver")

local server = restserver:new():port(8080)

local message = {message = "Hello World"}

server:add_resource("hello", {

   {
      method = "GET",
      path = "/",
      produces = "application/json",
      handler = function()
         return restserver.response():status(200):entity(message)
      end,
   }
})

server.server_name = "Hello world Server"

server:enable("restserver.xavante"):start()
