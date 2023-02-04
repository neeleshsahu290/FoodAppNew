import 'package:get_storage/get_storage.dart';

class SessionManager {
  static Future<void> setData(String key, dynamic value) async =>
      await GetStorage().write(key, value);

  static int getInt(String key) => GetStorage().read(key) ?? 0;

  static String getString(String key) => GetStorage().read(key) ?? "";

  static bool getBool(String key) => GetStorage().read(key) ?? false;

  static double? getDouble(String key) => GetStorage().read(key) ?? 0.0;

  static dynamic getData(String key) => GetStorage().read(key);

  static Future<void> clearDataAndLogout() async => await GetStorage().erase();

  // static logout() async {
  //   await setData(Constant.authToken, null);
  //   // final GoogleSignIn googleSignIn = GoogleSignIn();
  //   // var isSignedIn = await googleSignIn.isSignedIn();
  //   // if (isSignedIn) {
  //   //   googleSignIn.signOut();
  //   // }
  // }

  // isTokenExpire({getDecodedData = false}) {
  //   String? token = getString(Constant.authToken);
  //   if (token == "") return false;
  //   Map<String, dynamic> decodedToken =
  //       JwtDecoder.decode(getString(Constant.authToken));
  //   log("the token data$decodedToken");

  //   DateTime expirationDate = JwtDecoder.getExpirationDate(token);
  //   if (getDecodedData) return decodedToken;
  //   return !expirationDate
  //       .isAfter(DateTime.now().add(const Duration(minutes: 30)));
  // }
}
