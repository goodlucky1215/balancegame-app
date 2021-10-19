package com.example.balancegame.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.balancegame.databinding.CatalogItemBinding
import com.example.balancegame.model.CatalogDto

class CatalogListAdapter(val balanceGameStartClickListener: (CatalogDto) -> Unit ): ListAdapter<CatalogDto,CatalogListAdapter.CatalogListHolder>(diffUtil) {
    inner class CatalogListHolder(private val binding: CatalogItemBinding): RecyclerView.ViewHolder(binding.root){
        //Items를 itemsModel이라는 이름으로 받아온다.
        fun bind(catalogdto: CatalogDto){
            binding.catalogName.text  = catalogdto.catalogName

            binding.root.setOnClickListener {
                balanceGameStartClickListener(catalogdto)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CatalogListHolder {

        return CatalogListHolder(CatalogItemBinding.inflate(LayoutInflater.from(parent.context), parent,false))
    }

    override fun onBindViewHolder(holder: CatalogListHolder, position: Int) {
        holder.bind(currentList[position])
    }

    companion object {
        val diffUtil = object : DiffUtil.ItemCallback<CatalogDto>(){
            override fun areItemsTheSame(oldItem: CatalogDto, newItem: CatalogDto): Boolean {
                return oldItem==newItem
            }

            override fun areContentsTheSame(oldItem: CatalogDto, newItem: CatalogDto): Boolean {
                return oldItem.catalogId==newItem.catalogId
            }

        }
    }

}