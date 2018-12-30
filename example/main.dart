import 'package:cordova/cordova.dart';

int counter = 0;
void main() {
  Cordova cordova = new Cordova();
  cordova.isDeviceReady().then((bool isReady) {
    print('device is ready');
  });
}
