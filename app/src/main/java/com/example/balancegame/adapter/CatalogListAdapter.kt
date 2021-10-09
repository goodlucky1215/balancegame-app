package com.example.balancegame.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.View.inflate
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import com.example.balancegame.R
import com.example.balancegame.dao.CatalogDto

class CatalogListAdapter(val context: Context, val catalogList: ArrayList<CatalogDto>) : BaseAdapter() {
    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
        /* LayoutInflater는 item을 Adapter에서 사용할 View로 부풀려주는(inflate) 역할을 한다. */
        val view: View = LayoutInflater.from(context).inflate(R.layout.activity_main,null)
        /* 위에서 생성된 view를 R.layout.activity_main.xml 파일의 각 View와 연결하는 과정이다. */
        val catalogName = view.findViewById<TextView>(R.id.catalog_name)

        //가져온 데이터를 하나씩 불러옴.
        val list = catalogList[position]

        catalogName.text = list.catalog_name
        return view
    }

    override fun getItem(position: Int): Any {
        return catalogList[position]
    }

    override fun getItemId(position: Int): Long {
       return 0
    }

    override fun getCount(): Int {
        return catalogList.size
    }

}