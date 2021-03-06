import 'dart:async';
import 'dart:html';
import 'dart:js';

/// Cordova class is singleton here
class Cordova {
  static final Cordova _singleton = new Cordova._internal();
  bool _isDeviceReady = false;

  Stream<Event> _onPause = document.on['pause'].asBroadcastStream();
  Stream<Event> _onResume = document.on['resume'].asBroadcastStream();
  Stream<Event> _onMenuButton = document.on['menubutton'].asBroadcastStream();
  Stream<Event> _onBackButton = document.on['backbutton'].asBroadcastStream();

  factory Cordova() {
    return _singleton;
  }

  Cordova._internal() {
    document.on['deviceready']
        .take(1)
        .listen((Event event) => _isDeviceReady = true);
  }

  /// future of deviceready event
  Future<bool> isDeviceReady() {
    if (_isDeviceReady) {
      return Future.value(true);
    }
    Completer<bool> completer = new Completer();
    document.on['deviceready'].take(1).listen((Event event) {
      _isDeviceReady = true;
      completer.complete();
    });
    return completer.future;
  }

  bool isExist() {
    return JsObject.fromBrowserObject(context['window']).hasProperty('cordova');
  }

  Stream<Event> onPause() => _onPause;
  Stream<Event> onResume() => _onResume;
  Stream<Event> onMenuButton() => _onMenuButton;
  Stream<Event> onBackButton() => _onBackButton;
}
