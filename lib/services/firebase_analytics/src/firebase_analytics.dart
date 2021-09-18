import 'dart:async';
import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';


class FirebaseAnalyticsService {
  
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // ignore: unused_element
  // ignore: lines_longer_than_80_chars
  /// Method to send Analytics Event
  Future<void> _sendAnalyticsEvent(String name, Map<String, dynamic> parameters) async {
    await analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  /// 
  Future<void> _testSetAnalyticsCollectionEnabled() async {
    await analytics.setAnalyticsCollectionEnabled(false);
    await analytics.setAnalyticsCollectionEnabled(true);
  }

  /// Event to know user whose adding verses to favorite
  Future<void> _testAddToFavorite() async {
    await analytics.logAddToWishlist(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24,
      value: 123,
      currency: 'USD',
      itemLocationId: 'test location id',
    );
  }

  /// Event to know if user has open app
  Future<void> _testAppOpen() async {
    await analytics.logAppOpen();
  }
}