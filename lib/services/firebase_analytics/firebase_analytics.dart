import 'dart:core';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

/// Service to manage firebase analystic for
/// reporting differents users's activities
/// with events that we getting.
class FirebaseAnalyticsService {
  /// Use to access to different Firebase functions.
  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  /// A Observer that sends events
  /// to Firebase Analytics when the currently
  /// active Pageroute changes.
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: _analytics);

  /// Method to send custom Analytics Events.
  /// * [name] Represent name of event.
  /// * [parameters] Represent parameters to send for logs.
  Future<void> sendAnalyticsEvent(
      String name, Map<String, dynamic> parameters) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  /// Method for disabling and deactivating Analytics collection.
  Future<void> testSetAnalyticsCollectionEnabled({required bool test}) async {
    await _analytics.setAnalyticsCollectionEnabled(test);
  }

  /// Event to know if user has open app
  Future<void> testAppOpen() async {
    await _analytics.logAppOpen();
  }

  /// This event can help you identify the most popular content in your app.
  /// * [searchTerm] term that user mostly search.
  Future<void> testLogSearch(String searchTerm) async {
    await _analytics.logSearch(searchTerm: searchTerm);
  }

  /// Method for social features can log
  /// the Share event to identify the most
  /// viral content.
  /// eg:
  ///   A person can share a verse of the day
  ///   or a verse he want.
  /// * [contentType] type of content user shares.
  /// * [itemId] id of the shared content.
  /// * [method] which social media is used to share.
  Future<void> testShare(
      String contentType, String itemId, String method) async {
    await _analytics.logShare(
        contentType: contentType, itemId: itemId, method: method);
  }

  /// Method to check how much time user use application.
  /// * [milliseconds] time in milliseconds.
  Future<void> timeInApp(int milliseconds) async {
    await _analytics.android?.setSessionTimeoutDuration(milliseconds);
  }
}
