package com.example.balancegame

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.View.inflate
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import android.widget.ListView
import androidx.appcompat.app.AppCompatViewInflater
import com.example.balancegame.adapter.CatalogListAdapter
import com.example.balancegame.dao.CatalogDto

class MainActivity : AppCompatActivity() {
    val catalogList = arrayListOf<CatalogDto>(
        CatalogDto(1,"재밌는 랜덤게임 1"),
        CatalogDto(2,"재밌는 랜덤게임 2"),
        CatalogDto(3,"재밌는 랜덤게임 3"),
        CatalogDto(4,"재밌는 랜덤게임 4")
    )


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val catalogListView = ArrayAdapter(this, R.id.catalogListView)
        val catalogAdapter = CatalogListAdapter(this,catalogList)
        //catalogListView.ap = catalogAdapter
    }
}