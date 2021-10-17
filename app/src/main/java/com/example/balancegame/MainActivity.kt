package com.example.balancegame

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.View.inflate
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import android.widget.ListView
import android.widget.Toast
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
        //리스트뷰를 넣을 화면 불러옴.
        val catalogListView = findViewById<ListView>(R.id.catalogListView)
        //카탈로그 목록 가져오기
        val catalogAdapter = CatalogListAdapter(this,catalogList)
        //리스트 뷰 안에 카탈로그 목록 뿌려주기
        catalogListView.adapter = catalogAdapter
        //누르면 게임이 시작되도록 클릭이벤트
        catalogListView.setOnItemClickListener { parent, view, position, id ->
            Toast.makeText(this, catalogList[position].catalog_name, Toast.LENGTH_SHORT).show()
        }
    }
}