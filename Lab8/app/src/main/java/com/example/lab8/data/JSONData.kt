package com.example.lab8.data

import android.content.Context
import com.example.lab8.R
import com.example.lab8.model.Fruits
import org.json.JSONException
import org.json.JSONObject

class JSONData {
    var fruitList = ArrayList<Fruits>()

    fun getJSON(context: Context): ArrayList<Fruits>{
        var json = loadJSONFromRes(context)
        fruitList = parseJSON(json)
        return fruitList

    }
    fun loadJSONFromRes(context: Context): String{
        val inputStream = context.resources.openRawResource(R.raw.fruits)
        val jsonString = inputStream.bufferedReader().use {it.readText()}
        return jsonString
    }
    fun parseJSON(jsonString: String): ArrayList<Fruits>{
        try {
                val jsonObject = JSONObject(jsonString)

                val fruitArray = jsonObject.getJSONArray("fruits")

                for (i in 0 until fruitArray.length()){
                    val item = fruitArray.getJSONObject(i)

                    val name = item.getString("name")
                    val price = item.getString("price")

                    val newFruit = Fruits(name,price)

                    fruitList.add(newFruit)
                }

            }catch (e: JSONException){
            e.printStackTrace()


        }
        return fruitList
    }
}