import 'package:flutter/material.dart';
import 'package:flutter_project/utils/natives.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Pigeon Example")),
        body: Center(
          child: FutureBuilder(
            future: Natives.getCordinates(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Latitud: ${snapshot.data?.latitude}"),
                  Text("Longitud: ${snapshot.data?.longitude}"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
