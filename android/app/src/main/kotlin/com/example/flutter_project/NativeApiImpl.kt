package com.example.flutter_project

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationManager
import androidx.core.content.ContextCompat


class NativeApiImpl(private val context: Context): NativeApi {
    override fun sendMessage(msg: Message): Message {
        val reply = Message("Android recibió: ${msg.text}")
        return reply
    }

    override fun getCoordinates(): Cordinates {
        val locationManager = context.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        val fineLocation = ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION)
        val coarseLocation = ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION)

        if (fineLocation != PackageManager.PERMISSION_GRANTED && coarseLocation != PackageManager.PERMISSION_GRANTED) {
            return Cordinates(0.0, 0.0)
        }

        val location: Location? = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER)
            ?: locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER)

        return if (location != null) {
            Cordinates(location.latitude, location.longitude)
        } else {
            Cordinates(0.0, 0.0)
        }
    }

}