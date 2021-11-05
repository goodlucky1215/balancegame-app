package com.example.balancegame

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.balancegame.databinding.FragmentResultBinding

class ResultFragment : Fragment() {

    private val TAG = "IN_GAME";
    private lateinit var resultFragmentBinding: FragmentResultBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        resultFragmentBinding = FragmentResultBinding.inflate(layoutInflater, container, false)

        // 메인 페이지로 이동(밸런스 게임 리스트 페이지)
        resultFragmentBinding.goBalanceGameTextView.setOnClickListener {
            Log.i(TAG, "클릭")
            goMainPage()
        }
        resultFragmentBinding.goBalanceGameImageView.setOnClickListener {
            Log.i(TAG, "클릭")
            goMainPage()
        }

        resultFragmentBinding.shareImageView.setOnClickListener {
            Log.i(TAG, "공유하기 이미지 클릭")
            onShareToMyFriend()
        }

        resultFragmentBinding.shareTextView.setOnClickListener {
            Log.i(TAG, "공유하기 텍스트 클릭")
            onShareToMyFriend()
        }

        return resultFragmentBinding.root
    }

    // 메인 페이지로 이동(밸런스 게임 리스트 페이지)
    private fun goMainPage() {
        val intent = Intent(context, MainActivity::class.java)
        startActivity(intent)
    }

    private fun onShareToMyFriend() {
        val intent = Intent(Intent.ACTION_SEND)
        with(intent) {
            addCategory(Intent.CATEGORY_DEFAULT)
            putExtra(Intent.EXTRA_TEXT, "https://play.google.com/store/apps/details?id=balancegame")
            putExtra(Intent.EXTRA_TITLE, "밸런스 게임")
            setType("text/plain")
        }
        startActivity(Intent.createChooser(intent, "앱을 선택해주세요."))
    }

}