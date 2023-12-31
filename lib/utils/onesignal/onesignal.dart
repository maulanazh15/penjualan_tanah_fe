

import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../logger.dart';

const oneSignalAppId = "5ae35577-8572-46d7-acef-90f6e24a6fde";

Future<void> initOneSignal() async {
  // OneSignal.initialize(oneSignalAppId);
  final oneSignalShared = OneSignal.shared;
  
  oneSignalShared.setLogLevel(OSLogLevel.none, OSLogLevel.none);

  oneSignalShared.setRequiresUserPrivacyConsent(true);

  await oneSignalShared.setAppId(oneSignalAppId);
}

void registerOneSignalEventListener({
  required Function(OSNotificationOpenedResult) onOpened,
  required Function(OSNotificationReceivedEvent) onReceivedInForeground,
}) {
  final oneSignalShared = OneSignal.shared;

  oneSignalShared.setNotificationOpenedHandler(onOpened);

  oneSignalShared
      .setNotificationWillShowInForegroundHandler(onReceivedInForeground);
}

const tagName = "userId";

void sendUserTag(int userId) {
  OneSignal.shared.sendTag(tagName, userId.toString()).then((response) {
    vLog("Successfully sent tags with response: $response");
  }).catchError((error) {
    vLog("Encountered an error sending tags: $error");
  });
}

void deleteUserTag() {
  OneSignal.shared.deleteTag(tagName).then((response) {
    vLog("Successfully deleted tags with response $response");
  }).catchError((error) {
    vLog("Encountered error deleting tag: $error");
  });
}
