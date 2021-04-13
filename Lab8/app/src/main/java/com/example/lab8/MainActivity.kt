package com.example.lab8

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8.data.JSONData
import com.example.lab8.model.Fruits

class MainActivity : AppCompatActivity() {
    var FruitList = ArrayList<Fruits>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (savedInstanceState ==null){
            val data = JSONData()
            FruitList = data.getJSON(this)
        }
        setUpRecyclerView()

    }
private fun setUpRecyclerView(){val recyclerView: RecyclerView = findViewById(R.id.recyclerview)
    recyclerView.addItemDecoration(DividerItemDecoration(this,LinearLayoutManager.VERTICAL))

    val adapter = MyListAdapter(FruitList, {item: Fruits -> itemClicked(item)})
    recyclerView.adapter = adapter
    recyclerView.layoutManager = LinearLayoutManager(this,LinearLayoutManager.VERTICAL, false)
}
    private fun itemClicked(item: Fruits){
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = Uri.parse(item.info)
        startActivity(intent)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putParcelableArrayList("FruitList", FruitList)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle){
        super.onRestoreInstanceState(savedInstanceState)
FruitList = savedInstanceState.getParcelableArrayList<Fruits>("FruitList") as ArrayList<Fruits>
        setUpRecyclerView()}
}
