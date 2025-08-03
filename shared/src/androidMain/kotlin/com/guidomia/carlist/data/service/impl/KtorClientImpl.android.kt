package com.guidomia.carlist.data.service.impl

import com.guidomia.carlist.data.service.KtorClient
import io.ktor.client.HttpClient
import io.ktor.client.engine.okhttp.OkHttp

actual class KtorClientImpl actual constructor() : KtorClient {
    override fun createClient(): HttpClient {
        return HttpClient(OkHttp)
    }
}