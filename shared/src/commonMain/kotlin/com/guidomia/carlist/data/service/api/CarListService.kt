package com.guidomia.carlist.data.service.api

import com.guidomia.carlist.data.model.Car

interface CarListService {
    suspend fun getCars() : List<Car>
}