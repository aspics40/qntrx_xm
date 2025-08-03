package com.guidomia.carlist.data.service

import com.guidomia.carlist.data.model.Car
import com.guidomia.carlist.data.service.api.CarListService
import com.guidomia.carlist.data.service.api.impl.CarListServiceImpl
import com.guidomia.carlist.data.service.impl.KtorClientImpl

object ContentRepository {
    //TODO: Inject
    private val ktorClient: KtorClient = KtorClientImpl()
    private val carListService : CarListService = CarListServiceImpl(ktorClient)
    private val mutableCarList: MutableList<Car> = mutableListOf()

    private suspend fun fetchCars() {
        //TODO: Fetch and save cars
        val cars = carListService.getCars()
        saveCars(cars)
    }

    private fun saveCars(newCars: List<Car>) {
        //TODO: Save cars in DB
        mutableCarList.clear()
        mutableCarList.addAll(newCars)
    }

    suspend fun getCars(): List<Car> {
        //TODO: Get cars from DB
        if (mutableCarList.isEmpty()) {
            fetchCars()
        }
        return mutableCarList.toList()
    }
}