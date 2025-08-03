package com.guidomia.carlist.data.model

import kotlinx.serialization.Serializable

@Serializable
data class Car(
    val consList: List<String> = emptyList(),
    val customerPrice: Double,
    val make: String,
    val marketPrice: Double,
    val model: String,
    val prosList: List<String> = emptyList(),
    val rating: Int
)
