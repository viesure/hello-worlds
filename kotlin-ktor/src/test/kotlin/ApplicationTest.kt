package io.viesure.helloworlds

import io.ktor.http.*
import kotlin.test.*
import io.ktor.server.testing.*

class ApplicationTest {
    @Test
    fun testRoot() {
        withTestApplication({ module(testing = true) }) {
            handleRequest(HttpMethod.Get, "/").apply {
                assertEquals(HttpStatusCode.OK, response.status())
                assertEquals("Hello World!", response.content)
            }
        }
    }

    @Test
    fun testHelloWorld() {
        withTestApplication({ module(testing = true) }) {
            handleRequest(HttpMethod.Get, "/hello-world").apply {
                assertEquals(HttpStatusCode.OK, response.status())
                assertEquals("""{"hello":"world"}""", response.content)
            }
        }
    }

    @Test
    fun testHelloWorldWithName() {
        withTestApplication({ module(testing = true) }) {
            handleRequest(HttpMethod.Get, "/hello-world?name=viesure").apply {
                assertEquals(HttpStatusCode.OK, response.status())
                assertEquals("""{"hello":"viesure"}""", response.content)
            }
        }
    }

    @Test
    fun testHelloName() {
        withTestApplication({ module(testing = true) }) {
            handleRequest(HttpMethod.Get, "/hello/viesure").apply {
                assertEquals(HttpStatusCode.OK, response.status())
                assertEquals("""{"hello":"viesure"}""", response.content)
            }
        }
    }
}
