import 'dart:async';
import 'dart:html';

class Cordova {

  static final Cordova _singleton = new Cordova._internal();
  bool _isDeviceReady = false;

  Stream<Event> _onPause = window.on['pause'].asBroadcastStream();
  Stream<Event> _onResume = window.on['resume'].asBroadcastStream();
  Stream<Event> _onMenuButton = window.on['menubutton'].asBroadcastStream();
  Stream<Event> _onBackButton = window.on['backbutton'].asBroadcastStream();

  factory Cordova() {
    return _singleton;
  }

  Cordova._internal() {
    window.on['deviceready'].take(1).listen((Event event) => _isDeviceReady = true);
  }

  Future<bool> isDeviceReady() {
    if (_isDeviceReady) {
      return Future.value(true);
    }
    Completer<bool> completer = new Completer();
     window.on['deviceready'].take(1).listen((Event event){
      _isDeviceReady = true;
      completer.complete();
    });
    return completer.future;
  }

  Stream<Event> onPause() => _onPause;
  Stream<Event> onResume() => _onResume;
  Stream<Event> onMenuButton() => _onMenuButton;
  Stream<Event> onBackButton() => _onBackButton;

}