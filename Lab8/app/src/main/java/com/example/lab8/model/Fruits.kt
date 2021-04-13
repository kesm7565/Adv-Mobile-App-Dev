package com.example.lab8.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize data class Fruits (val name:String, val info: String): Parcelable {

}