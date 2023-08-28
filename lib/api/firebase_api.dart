import 'package:trashout/constants/constants.dart';
import 'package:trashout/constants/globalVariables.dart';

class FirebaseApi {
  Future<void> initNotifications() async {
    await fcm.requestPermission();
    final fcmToken = await fcm.getToken();
    fcmtoken = fcmToken;
    print(fcmToken);
  }
}
