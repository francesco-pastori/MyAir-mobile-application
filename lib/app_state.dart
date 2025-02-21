import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _notifications = prefs.getBool('ff_notifications') ?? _notifications;
    });
    _safeInit(() {
      _position = prefs.getBool('ff_position') ?? _position;
    });
    _safeInit(() {
      _floatingChatIcon =
          prefs.getBool('ff_floatingChatIcon') ?? _floatingChatIcon;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _notifications = true;
  bool get notifications => _notifications;
  set notifications(bool value) {
    _notifications = value;
    prefs.setBool('ff_notifications', value);
  }

  bool _position = true;
  bool get position => _position;
  set position(bool value) {
    _position = value;
    prefs.setBool('ff_position', value);
  }

  bool _floatingChatIcon = true;
  bool get floatingChatIcon => _floatingChatIcon;
  set floatingChatIcon(bool value) {
    _floatingChatIcon = value;
    prefs.setBool('ff_floatingChatIcon', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
