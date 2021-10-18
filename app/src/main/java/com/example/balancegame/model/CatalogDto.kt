package com.example.balancegame.model


import com.google.gson.annotations.SerializedName

data class CatalogDto(
    @SerializedName("catalogId") val catalogId: Long,
    @SerializedName("catalogName") val catalogName: String
)
/* 값을 가져오는 데이터의 예제
{
    "success": true,
    "data": [
    {
        "catalogId": 1,
        "catalogName": "재밌는 랜덤게임",
        "questionDtos": []
    },
    {
        "catalogId": 2,
        "catalogName": "웃긴 랜덤게임",
        "questionDtos": []
    }
    ],
    "message": null

 */