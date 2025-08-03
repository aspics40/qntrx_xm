package com.guidomia.carlist.data.service.api.impl

import com.guidomia.carlist.data.model.Car
import com.guidomia.carlist.data.service.KtorClient
import com.guidomia.carlist.data.service.api.CarListService
import io.ktor.client.request.get
import io.ktor.client.statement.bodyAsText
import kotlinx.serialization.json.Json

class CarListServiceImpl(private val ktorClient: KtorClient) : CarListService {
    companion object {
        private const val ENDPOINT_URL = "https://gist.githubusercontent.com/aspics40/fdc2ca636b428d573deb47829605b307/raw/b1b742b3ecb0b255bbf47339699432076e07dc12/gistfile1.txt"
    }

    override suspend fun getCars(): List<Car> {
        return ktorClient.createClient().use {
            val result = it.get(ENDPOINT_URL)
            Json.decodeFromString(result.bodyAsText())
        }
    }
}