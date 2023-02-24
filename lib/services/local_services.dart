import 'dart:convert' as convert;
import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:gameapp/constants/global_data.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/services/webservices.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';


import '../constants/global_keys.dart';
import '../functions/navigation_functions.dart';
import '../modals/user_modal.dart';
import '../widgets/showSnackbar.dart';
import 'api_urls.dart';


// UserModal? userData;
ValueNotifier<UserModal?> userDataNotifier = ValueNotifier(null);
late SharedPreferences sharedPreference;
class MyLocalServices{
  static Future<UserModal> updateSharedPreferences(Map userMap) async{
    String userDataString  = convert.jsonEncode(userMap);
    print('updating sharedpreference : $userDataString');
    sharedPreference.setString('userData', userDataString);
    userDataNotifier.value = UserModal.fromJson(userMap);
    if(userDataNotifier.value!.token!=''){
      print('Updating the user token with ${userDataNotifier.value!.token}.....update shared preference');
      userToken = userDataNotifier.value!.token;
      globalHeaders['Authorization'] = 'Bearer ${userToken}';
    }

    print('the user modal data is ${userDataNotifier.value!.fullData}');
    // String? token = await FirebasePushNotifications.getToken();
    // if(token!=null)
    //   await Webservices.updateDeviceToken(userId: userMap['id'], token: token);
    return userDataNotifier.value!;
  }

  static Future<UserModal> updateSharedPreferencesFromServer(String userId)async{
    Map userMap = await Webservices.getMap(ApiUrls.getUserDetails + '$userId');
    return updateSharedPreferences(userMap);
    // retur
  }

  static Future<bool> isLoggedIn()async{
    sharedPreference =await  SharedPreferences.getInstance();
    if(sharedPreference.getString('userData')!=null){


      Map userMap = convert.jsonDecode(sharedPreference.getString('userData')!);
      print('the userMap is ${userMap}');
      userDataNotifier.value = UserModal.fromJson(userMap);
      print('the user token is ${userMap['token']}');

      if(userDataNotifier.value!.token!=''){
        print('Updating the user token with ${userDataNotifier.value!.token} is logged in');
        userToken = userDataNotifier.value!.token;
        globalHeaders['Authorization'] = 'Bearer ${userToken}';
      }
      return true;
    }
    return false;
  }

  static Future<void> logout() async{
    print('logout call---');
    //TODO: uncomment when notification setup completes
    // await Webservices.updateDeviceToken(userId: '${userData!.userId}', token: '');
    await sharedPreference.remove('userData');
    print('the ${sharedPreference.getString('userData')}');
    userDataNotifier.value = null;
    userToken = '';
    globalHeaders.remove('Authorization');
    Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
    pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: LoginScreen(),);
  }

}