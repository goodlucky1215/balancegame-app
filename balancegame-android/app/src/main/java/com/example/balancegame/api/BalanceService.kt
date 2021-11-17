package com.example.balancegame.api

import com.example.balancegame.model.CatalogGetDto
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface BalanceService {
    //카탈로그 목록을 받아옴
    @GET("/api/1.0/catalogs")
    fun getCatalogsList(
    ): Call<CatalogGetDto>
}