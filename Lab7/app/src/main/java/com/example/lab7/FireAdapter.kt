package com.example.lab7

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.model.fire

class FireAdapter(private val firelist: ArrayList<fire>, private val clickListener:(fire) -> Unit): RecyclerView.Adapter<FireAdapter.ViewHolder>() {

    class ViewHolder(view: View): RecyclerView.ViewHolder(view){
        val fireTextView: TextView = view.findViewById(R.id.textView)
    }
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item,parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val fire = firelist[position]
        holder.fireTextView.text = fire.name
        holder.itemView.setOnClickListener{clickListener(fire)}
    }
    override fun getItemCount()=firelist.size


}