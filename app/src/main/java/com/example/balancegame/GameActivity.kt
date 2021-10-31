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
    private val TAG = "IN_GAME";
    private val MAX_PROBLEM_NUMBER = 16;
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
            if (questionNum < MAX_PROBLEM_NUMBER) {
                gameActivityBinding.questionTextView.text = questionList[questionNum][0]
                gameActivityBinding.choiceButtonA.text = questionList[questionNum][1]
                gameActivityBinding.choiceButtonB.text = questionList[questionNum][2]
            } else if (questionNum >= MAX_PROBLEM_NUMBER) {
                goResultPage()
            }
            questionNum++
        }
        gameActivityBinding.choiceButtonB.setOnClickListener{
            if (questionNum < MAX_PROBLEM_NUMBER) {
                gameActivityBinding.questionTextView.text = questionList[questionNum][0]
                gameActivityBinding.choiceButtonA.text = questionList[questionNum][1]
                gameActivityBinding.choiceButtonB.text = questionList[questionNum][2]
            } else if (questionNum >= MAX_PROBLEM_NUMBER) {
                goResultPage()
                Log.i(TAG, "여기")
            }
            questionNum++
            Log.i(TAG, questionNum.toString());
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

    private fun goResultPage() {
        supportFragmentManager.beginTransaction()
            .replace(R.id.gameActivity, ResultFragment()).commit()
    }
}