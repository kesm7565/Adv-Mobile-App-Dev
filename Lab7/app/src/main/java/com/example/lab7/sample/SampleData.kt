package com.example.lab7.sample

import com.example.lab7.R
import com.example.lab7.model.fire

object SampleData {
    val fireList = ArrayList<fire>()

    init{
        fireList.add(fire("Real Fire", R.drawable.download))
        fireList.add(fire("Super Hot Fire", R.drawable.download2))
        fireList.add(fire("Flaming Hot", R.drawable.download3))
        fireList.add(fire("Spicy Hot", R.drawable.download4))
    }
}