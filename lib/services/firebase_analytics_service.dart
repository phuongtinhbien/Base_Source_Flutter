import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class FirebaseAnalyticsService {

  static FirebaseAnalyticsService instance;
  FirebaseAnalytics analytics;
  FirebaseAnalyticsObserver observer;
  FirebaseAnalyticsService(){
      analytics =  FirebaseAnalytics();
      observer = FirebaseAnalyticsObserver(analytics: analytics);
  }

  static FirebaseAnalyticsService getInstance(){
    if (instance == null) {
      instance = FirebaseAnalyticsService();
    }
    return instance;
  }

  Future<void> setCurrentScreen({screenName,screenClassOverride}) async {
    await analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenClassOverride,
    );
  }

  Future<void> _sendAnalyticsEvent({String eventName, Map<String, dynamic> parameters})  async {
    await analytics.logEvent(
      name: eventName,
      parameters: parameters
    );
  }

}