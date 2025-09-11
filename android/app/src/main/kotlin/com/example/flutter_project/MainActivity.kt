package com.example.flutter_project

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NativeApi.setUp(flutterEngine.dartExecutor.binaryMessenger, NativeApiImpl(this))
    }
}