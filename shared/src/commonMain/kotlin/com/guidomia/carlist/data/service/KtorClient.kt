package com.guidomia.carlist.data.service

import io.ktor.client.HttpClient

interface KtorClient {
    fun createClient() : HttpClient
}