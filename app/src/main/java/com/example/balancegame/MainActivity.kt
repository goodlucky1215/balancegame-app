package com.example.balancegame

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.ListView
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.balancegame.adapter.CatalogListAdapter
import com.example.balancegame.api.BalanceService
import com.example.balancegame.model.CatalogDto
import com.example.balancegame.model.CatalogGetDto
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : AppCompatActivity() {
    //get,post url주소
    private lateinit var balanceService : BalanceService
    private lateinit var  catalogAdapter : CatalogListAdapter
    val urlSave = UrlSave()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //리스트뷰를 넣을 화면 불러옴.
        val catalogListView = findViewById<ListView>(R.id.catalogListView)
        //카탈로그 목록 가져오기/////////////////////////////////////////
        //1. retroifit으로 내가 연결해야할 서버에 접속 , Gson으로 컨버터 해주는 부분
        val retrofit = Retrofit.Builder()
            .baseUrl(urlSave.ipNum)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
        //2.url을 불러오는 부분
        balanceService = retrofit.create(BalanceService::class.java)

        //3.카탈로그 목록을 불러옴.=>catalogList가 담겨짐
        balanceService.getCatalogsList()
            .enqueue(object: Callback<CatalogGetDto>{
                //api 요청 성공시
                override fun onResponse(
                    call: Call<CatalogGetDto>,
                    response: Response<CatalogGetDto>
                ) {
                    if(response.isSuccessful.not()){
                        Log.e("main_fail","Not Success!!")
                        return
                    }
                    response.body()?.let{
                        catalogAdapter  = CatalogListAdapter(this@MainActivity,it.catalogListData)
                        //리스트 뷰 안에 카탈로그 목록 뿌려주기
                        catalogListView.adapter = catalogAdapter
                        Toast.makeText(applicationContext,  "접속 성공", Toast.LENGTH_SHORT).show()
                    }
                }

                //api 요청 실패시
                override fun onFailure(call: Call<CatalogGetDto>, t: Throwable) {
                    Log.e("api 요청이 실패하였습니다.",t.toString())
                }

            })

        //누르면 게임이 시작되도록 클릭이벤트
        //catalogListView.setOnItemClickListener { parent, view, position, id ->
        //     Toast.makeText(this, catalogList[position].catalogName, Toast.LENGTH_SHORT).show()
        //}
    }

}