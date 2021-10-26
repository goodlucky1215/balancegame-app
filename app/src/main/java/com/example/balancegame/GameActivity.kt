package com.example.balancegame

import android.content.res.AssetManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import com.example.balancegame.databinding.ActivityGameBinding
import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.io.InputStream

class GameActivity : AppCompatActivity() {
    //메인 UI
    private lateinit var gameActivityBinding: ActivityGameBinding
    //문제 목록
    private lateinit var questionList : ArrayList<List<String>>

    /*
    val questionList = arrayOf(
        arrayOf("3","3","#"),
        arrayOf("4","4","*")
    )
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_game)

        //화면 가져오기
        gameActivityBinding = ActivityGameBinding.inflate(layoutInflater)
        setContentView(gameActivityBinding.root)

        questionDownload(intent.getStringExtra("catalogId"))
        var questionNum : Int = 0
        gameActivityBinding.questionTextView.text = questionList[questionNum][0]
        gameActivityBinding.choiceButtonA.text = questionList[questionNum][1]
        gameActivityBinding.choiceButtonB.text = questionList[questionNum][2]
        Toast.makeText(this, questionList[0][0]+" "+questionList[0][1]+" "+questionList[0][2], Toast.LENGTH_SHORT).show()

        gameActivityBinding.choiceButtonA.setOnClickListener{
            questionNum++
            gameActivityBinding.questionTextView.text = questionList[questionNum][0]
            gameActivityBinding.choiceButtonA.text = questionList[questionNum][1]
            gameActivityBinding.choiceButtonB.text = questionList[questionNum][2]
        }
        gameActivityBinding.choiceButtonB.setOnClickListener{
            questionNum++
            gameActivityBinding.questionTextView.text = questionList[questionNum][0]
            gameActivityBinding.choiceButtonA.text = questionList[questionNum][1]
            gameActivityBinding.choiceButtonB.text = questionList[questionNum][2]
        }
    }

    private fun questionDownload(fileName: String?) {
        questionList = ArrayList()
        val path = "1.txt"
        val assetManager: AssetManager = resources.assets
        val inputStream: InputStream = assetManager.open("1.txt")
        inputStream.bufferedReader().readLines().forEach {
            val question = it.split("/")
            questionList.add(question)
            Toast.makeText(this, questionList[0][0]+" "+questionList[0][1]+" "+questionList[0][2], Toast.LENGTH_SHORT).show()
        }
    }
}