package com.guidomia.carlist.data.service.impl

import com.guidomia.carlist.data.service.KtorClient
import io.ktor.client.HttpClient
import io.ktor.client.engine.darwin.Darwin
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

actual class KtorClientImpl actual constructor() : KtorClient {
    override fun createClient(): HttpClient {
        return HttpClient(Darwin) {
            install(ContentNegotiation) {
                json( Json {
                    isLenient = true;
                    ignoreUnknownKeys = true;
                })
            }
        }
    }
}