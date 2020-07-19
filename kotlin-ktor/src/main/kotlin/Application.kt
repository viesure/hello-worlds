package io.viesure.helloworlds

import io.ktor.application.*
import io.ktor.response.*
import io.ktor.features.*
import io.ktor.routing.*
import io.ktor.http.*
import io.ktor.gson.*

fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)

@Suppress("unused") // Referenced in application.conf
@kotlin.jvm.JvmOverloads
fun Application.module(testing: Boolean = false) {
    install(DefaultHeaders)

    install(ContentNegotiation) {
        gson {
        }
    }

    routing {
        get("/") {
            call.respondText("Hello World!", contentType = ContentType.Text.Plain)
        }

        get("/hello-world") {
            val name = call.request.queryParameters["name"] ?: "world"
            call.respond(mapOf("hello" to name))
        }

        get("/hello/{name}") {
            val name = call.parameters["name"]
            call.respond(mapOf("hello" to name))
        }
    }
}


