package com.example.balancegame

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.balancegame.databinding.FragmentResultBinding

class ResultFragment : Fragment() {

    private lateinit var resultFragmentBinding: FragmentResultBinding

    var mainActivity: MainActivity? = null
    override fun onAttach(context: Context) {
        super.onAttach(context)
        mainActivity = context as MainActivity
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        resultFragmentBinding = FragmentResultBinding.inflate(layoutInflater, container, false)

        // 메인 페이지로 이동(밸런스 게임 리스트 페이지)
        resultFragmentBinding.goBalanceGameTextView.setOnClickListener {
            goMainPage();
        }
        resultFragmentBinding.goBalanceGameImageView.setOnClickListener {
            goMainPage();
        }
        //

        return inflater.inflate(R.layout.fragment_result, container, false)
    }

    // 메인 페이지로 이동(밸런스 게임 리스트 페이지)
    private fun goMainPage() {
        mainActivity?.let {
            val intent = Intent(context, MainActivity::class.java)
            startActivity(intent)
        }
    }

}