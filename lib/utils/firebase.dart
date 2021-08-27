import 'dart:math' as math;

import 'package:firebase_analytics/firebase_analytics.dart' show FirebaseAnalytics;
import 'package:firebase_analytics/observer.dart' show FirebaseAnalyticsObserver;
import 'package:shared_preferences/shared_preferences.dart';

abstract class FbUtils {
  static _FbUtils _instance;

  factory FbUtils() {
    if (_instance == null) _instance = _FbUtils();
    return _instance;
  }

  /// return the firebase analytic instance
  FirebaseAnalytics get analytics;

  /// return the firebase analytic navigation observer instance
  FirebaseAnalyticsObserver get observer;

  /// set the current screen to analytic
  void setCurrentScreen({String screenName});

  /// send analytic event to firebase analytique
//  Future<void> sendAnalyticsEvent({FbEvent event, Map<String, dynamic> parameter});
}

enum FbEvent { first_open }

class _FbUtils implements FbUtils {
  FirebaseAnalytics _analytics;
  FirebaseAnalyticsObserver _observer;

//  @override
//  Future<void> sendAnalyticsEvent({@required FbEvent event, Map<String, dynamic> parameter}) async {
//    assert(event != null);
//    String _event;
//    switch (event) {
//      case FbEvent.first_open:
//        _event = "first_open";
//        break;
//      default:
//        assert(false);
//    }
//    await analytics.logEvent(name: _event, parameters: parameter);
//  }
  _FbUtils() {
    _analytics = FirebaseAnalytics();
    _observer = FirebaseAnalyticsObserver(analytics: analytics);
    _setUserId();
  }

  String _oldScreen;

  void setCurrentScreen({String screenName}) {
    if (screenName == _oldScreen) return;
    _oldScreen = screenName;
    _observer.analytics.setCurrentScreen(screenName: screenName);
  }

  @override
  FirebaseAnalytics get analytics => _analytics;

  @override
  FirebaseAnalyticsObserver get observer => _observer;

  Future<void> _setUserId() async {
    final pref = await SharedPreferences.getInstance();
    String userId = pref.getString(KeyFb.USER_ID);
    if (userId == null) {
      userId = "${_GenKey(15)}";
      pref.setString(KeyFb.USER_ID, userId);
    }
    analytics.setUserId(userId);
    return null;
  }
}

mixin KeyFb {
  static const USER_ID = "USER_ID";
}

class _GenKey {
  final int count;

  @override
  String toString() {
    String res = "";
    for (int i = 1; i <= count; i++) {
      res += "${math.Random().nextInt(10)}";
    }
    return res;
  }

  _GenKey(this.count);
}
