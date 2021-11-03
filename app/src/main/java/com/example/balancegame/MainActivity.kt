package com.example.balancegame

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.ListView
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.balancegame.adapter.CatalogListAdapter
import com.example.balancegame.api.BalanceService
import com.example.balancegame.databinding.ActivityMainBinding
import com.example.balancegame.model.CatalogDto
import com.example.balancegame.model.CatalogGetDto
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : AppCompatActivity() {
    //메인 UI
    private lateinit var mainActivityBinding: ActivityMainBinding
    //어댑터 - 카탈로그 리스트
    private lateinit var  catalogListAdapter : CatalogListAdapter
    //get,post url주소
    private lateinit var balanceService : BalanceService
    val urlSave = UrlSave()
    //사용자 구분 코드
    private lateinit var userCode : String
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        mainActivityBinding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(mainActivityBinding.root)

        

        //카탈로그 목록 가져오기/////////////////////////////////////////
        //1. retroifit으로 내가 연결해야할 서버에 접속 , Gson으로 컨버터 해주는 부분
        val retrofit = Retrofit.Builder()
            .baseUrl(urlSave.ipNum)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
        //2.url을 불러오는 부분
        balanceService = retrofit.create(BalanceService::class.java)

        //3.어댑터를 먼저 선언
        initCatalogListAdapter()
        //4.어댑터에서 뷰로 카테고리 목록을 전부 가져옴
        initBalanceListRecyclerView()

    }

    private fun initCatalogListAdapter() {
        //어댑터 선언
        catalogListAdapter = CatalogListAdapter(balanceGameStartClickListener = {
            //여기에 게임 접속 화면을 연결하면 됨***////////////////////
            Toast.makeText(this, " 게임번호 : "+it.catalogId.toString()+", 게임이름 : "+it.catalogName, Toast.LENGTH_SHORT).show()
            val intent = Intent(this, GameActivity::class.java)
                .putExtra("catalogId", Integer.parseInt(it.catalogId.toString())) //kotlin은 형 변환에 예민~~
                .putExtra("userCode", userCode)
            startActivity(intent)
        })
        mainActivityBinding.catalogRecyclerView.layoutManager = LinearLayoutManager(this)
        mainActivityBinding.catalogRecyclerView.adapter = catalogListAdapter
    }


    private fun initBalanceListRecyclerView() {
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
                        //리스트 뷰 안에 카탈로그 목록 뿌려주기
                        catalogListAdapter.submitList(it.catalogListData?.orEmpty())
                        userCode = it.userCode
                        Toast.makeText(applicationContext,  "접속 성공", Toast.LENGTH_SHORT).show()
                    }
                }

                //api 요청 실패시
                override fun onFailure(call: Call<CatalogGetDto>, t: Throwable) {
                    Log.e("api 요청이 실패하였습니다.",t.toString())
                }

            })
    }

}