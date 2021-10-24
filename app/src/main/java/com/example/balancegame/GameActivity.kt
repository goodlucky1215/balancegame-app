package com.example.balancegame

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import com.example.balancegame.databinding.ActivityGameBinding
import java.io.BufferedReader
import java.io.File
import java.io.FileReader

class GameActivity : AppCompatActivity() {
    //메인 UI
    private lateinit var gameActivityBinding: ActivityGameBinding
    //문제 목록
    //private lateinit var questionList : ArrayList<List<String>>

    val questionList = arrayOf(
        arrayOf("3","3","#"),
        arrayOf("3","3","#")
    )
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_game)

        gameActivityBinding = ActivityGameBinding.inflate(layoutInflater)

        //questionDownload(intent.getStringExtra("catalogId"))
        val questionNum = 0
        gameActivityBinding.questionTextView.text = questionList[questionNum][0]
        gameActivityBinding.choiceButtonA.text = questionList[questionNum][1]
        gameActivityBinding.choiceButtonB.text = "45345345"
        //Toast.makeText(this, questionList[0][0]+" "+questionList[0][1]+" "+questionList[0][2], Toast.LENGTH_SHORT).show()
    }

    /*
    private fun questionDownload(fileName: String?) {
        questionList = ArrayList()
        val path = "C:\\balancegameQuestion\\fileName.txt"
        Log.e("path ",path)
        val file = File(path)
        val reader = FileReader(file)
        val buffer = BufferedReader(reader)
        var temp = ""
        while(true){
            temp = buffer.readLine()
            if (temp == null) break
            val question = temp.toString().split("/")
            questionList.add(question)
        }
        buffer.close()
    }
    */
}