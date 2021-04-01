package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView

class DetailActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        val name = intent.getStringExtra("name")
        val resourceID = intent.getIntExtra("resourceID", -1)
        val fireImage: ImageView = findViewById(R.id.imageViewFire)
        fireImage.setImageResource(resourceID)
        val fireName: TextView = findViewById(R.id.textView2)
        fireName.text = name
    }
}