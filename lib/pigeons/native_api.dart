import 'package:flutter_project/models/cordinates.dart';
import 'package:flutter_project/models/message.dart';
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/native_api.g.dart',
    kotlinOut:
        'android/app/src/main/kotlin/com/example/flutter_project/NativeApi.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.flutter_project'),
  ),
)
@HostApi()
abstract class NativeApi {
  Message sendMessage(Message msg);

  Cordinates getCoordinates();
}
