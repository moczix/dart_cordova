
import 'dart:html';

import 'package:cordova/cordova.dart';


int counter = 0;
void main() {
  Cordova cordova = new Cordova();
  cordova.isDeviceReady().then((bool isReady) {
    print('device is ready');
    test();
  });
}

void test() {
  Cordova cordova = new Cordova();
  cordova.isDeviceReady().then((bool isReady) {
    print('test');
  });
}