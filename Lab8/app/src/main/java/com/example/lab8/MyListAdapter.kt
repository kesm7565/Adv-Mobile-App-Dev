package com.example.lab8

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8.model.Fruits
import com.google.android.material.datepicker.MaterialPickerOnPositiveButtonClickListener

class MyListAdapter (private val fruitList: ArrayList<Fruits>, private val clickListener: (Fruits) -> Unit): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {
    class ViewHolder(view: View): RecyclerView.ViewHolder(view){
        val itemTextView: TextView = view.findViewById(R.id.textView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val item = fruitList[position]
        holder.itemTextView.text = item.name
        holder.itemView.setOnClickListener{clickListener(item)}
    }

    override fun getItemCount() = fruitList.size

}