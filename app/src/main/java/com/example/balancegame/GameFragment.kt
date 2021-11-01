package com.example.balancegame

import android.content.Context
import android.content.res.AssetManager
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.example.balancegame.databinding.FragmentGameBinding
import java.io.InputStream

class GameFragment : Fragment() {
    private val TAG = "IN_GAME";
    private val MAX_PROBLEM_NUMBER = 16;
    //메인 UI
    private lateinit var gameFragmentBinding: FragmentGameBinding
    //문제 목록
    private lateinit var questionList : ArrayList<List<String>>


    var gameActivity: GameActivity? = null
    //이게 있어야 결과로 이동할 수 있다. => attach가
    override fun onAttach(context: Context) {
        super.onAttach(context)
        gameActivity = context as GameActivity
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        //화면 가져오기
        gameFragmentBinding = FragmentGameBinding.inflate(layoutInflater, container, false)

        //문제 가져오기
        questionDownload(getActivity()?.getIntent()?.getStringExtra("catalogId"))

        //선택한 번호 담는 통
        val answerList = ArrayList<Int>()

        //문제 선택시작
        var questionNum : Int = 0
        gameFragmentBinding.questionTextView.text = questionList[questionNum][0]
        gameFragmentBinding.choiceButtonA.text = questionList[questionNum][1]
        gameFragmentBinding.choiceButtonB.text = questionList[questionNum][2]
        Toast.makeText(requireContext(), questionList[0][0]+" "+questionList[0][1]+" "+questionList[0][2], Toast.LENGTH_SHORT).show()

        gameFragmentBinding.choiceButtonA.setOnClickListener{
            answerList.add(1)
            questionNum++
            if (questionNum < MAX_PROBLEM_NUMBER) {
                gameFragmentBinding.questionTextView.text = questionList[questionNum][0]
                gameFragmentBinding.choiceButtonA.text = questionList[questionNum][1]
                gameFragmentBinding.choiceButtonB.text = questionList[questionNum][2]
            } else if (questionNum >= MAX_PROBLEM_NUMBER) {
                //결과 페이지로 이동
                gameActivity!!.goResultPage(answerList)
            }
        }
        gameFragmentBinding.choiceButtonB.setOnClickListener{
            answerList.add(2)
            questionNum++
            if (questionNum < MAX_PROBLEM_NUMBER) {
                gameFragmentBinding.questionTextView.text = questionList[questionNum][0]
                gameFragmentBinding.choiceButtonA.text = questionList[questionNum][1]
                gameFragmentBinding.choiceButtonB.text = questionList[questionNum][2]
            } else if (questionNum >= MAX_PROBLEM_NUMBER) {
                //결과 페이지로 이동
                gameActivity!!.goResultPage(answerList)
            }
        }

        return gameFragmentBinding.root

    }

    private fun questionDownload(fileName: String?) {
        questionList = ArrayList()
        val path = "1.txt"
        val assetManager: AssetManager = resources.assets
        val inputStream: InputStream = assetManager.open("1.txt")
        inputStream.bufferedReader().readLines().forEach {
            val question = it.split("/")
            questionList.add(question)
        }
    }

}
