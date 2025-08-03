package com.guidomia.carlist

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform