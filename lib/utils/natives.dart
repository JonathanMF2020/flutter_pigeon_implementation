import 'package:flutter_project/native_api.g.dart';

class Natives {
  static Future<Cordinates?> getCordinates() async {
    final api = NativeApi();
    final response = await api.getCoordinates();
    return response;
  }

  Future<String?> sendMessage() async {
    final api = NativeApi();
    final response = await api.sendMessage(
      Message()..text = "Hola desde Flutter!",
    );
    return response.text;
  }
}
