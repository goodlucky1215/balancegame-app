package com.example.balancegame

import android.content.Intent
import android.content.res.AssetManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import com.example.balancegame.databinding.ActivityGameBinding
import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.io.InputStream

class GameActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_game)
        goGamePage()

    }

    private fun goGamePage() {
        supportFragmentManager.beginTransaction()
            .replace(R.id.gameActivity, GameFragment()).commit()
    }

    fun goResultPage(answerList : ArrayList<Int>) {
        //몇번째 게임인지 받아오니깐 값 저장할 때 이걸 이용해서 insert하면 됨
        Toast.makeText(this
            ,intent.getStringExtra("userCode") +" ===> "+intent.getIntExtra("catalogId",0).toString()
            , Toast.LENGTH_SHORT).show()
        //answerList는 선택한 결과서임!!
        //여기서 결과를 저장하고 화면 이동을 하는게 낫지???

        var resultFragment = ResultFragment()
        var bundle = Bundle()
        bundle.putInt("num1",1) //사람을 구분해서 공유받으려면...여기서 조치를 해야할듯?
        resultFragment.arguments = bundle //fragment의 arguments에 데이터를 담은 bundle을 넘겨줌

        supportFragmentManager
            .beginTransaction()
            .replace(R.id.gameActivity, ResultFragment())
            .commit()

    }
}