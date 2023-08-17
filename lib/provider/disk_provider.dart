import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../utils/app_constants.dart';

///final sharedPrefs = Provider<SharedPreferences>((ref) {
///  throw UnimplementedError();
///});

class DiskData {
  const DiskData(this.ref);
  final Ref ref;

  void setToken(String token) {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  void setUserId(String id) {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    sharedPreferences.setString(AppConstants.USER_ID, id);
  }

  void setName(String name){
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    sharedPreferences.setString(AppConstants.NAME, name);
  }

  Future<void> setHasLinkedAccount(bool hasLinkedAccount) async{
    final String hasLinkedAccountString = hasLinkedAccount.toString();
    print("has linked account var -> " + hasLinkedAccountString);
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    await sharedPreferences.setString(AppConstants.HAS_LINKED_ACCOUNT, hasLinkedAccountString);
    print(isAccountLinked().toString() + "help flaggg");
  }

  Future<int> isAccountLinked() async{
    print("checking if linked");
    final sharedPreferences = await ref.read(sharedPreferencesProvider).getString(AppConstants.HAS_LINKED_ACCOUNT);
    print(sharedPreferences.toString() + "aaaaaaaaaaaaaaaaaaa" );
    if (sharedPreferences == "true") {
      print("has a linked account");
      return 200;
    } else {
      print("has not linked account yet");
      return 500;
    }
  }
  ///
  ///void setUserId(String user_id) {
  ///  pref?.setString(AppConstants.USER_ID, user_id);
  ///}
  ///
  ///int clear() {
  ///  pref?.remove(AppConstants.TOKEN);
  ///  //value.remove(AppConstants.USER_ID);
  ///  pref?.remove(AppConstants.PASSWORD);
  ///  print("ran");
  ///  return 200;
  ///}

  int clear(){
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    setToken("false");
    setName("");
    setUserId("");
    setHasLinkedAccount(false);
    print('--------------');
    print(isTokenSet.toString());
    print(isAccountLinked.toString());
    print('--------------');
    return 200;

  }

  dynamic getUserId(){
    return ref.read(sharedPreferencesProvider).getString(AppConstants.USER_ID)??"-1";
    //return userid;
  }
  dynamic isTokenSet() async {
    final sharedPreferences = ref.read(sharedPreferencesProvider).getString(
        AppConstants.TOKEN);
    if (sharedPreferences != "false") {
      print("isnt null");
      return 200;
    }
  }

//int isTokenSet() {
//  final sharedPreferences =  ref.read(sharedPreferencesProvider).getString(AppConstants.TOKEN);
//
//  if ( sharedPreferences != "false") {
//    print("isnt null");
//    return 200;
//  } else {
//    print("is null");
//    return 500;
//  }
//}
}
final diskDataProvider = Provider<DiskData>((ref) => DiskData(ref));
///
///class DiskData{
///  var result = 400;
///  final pref = SharedPreferences.getInstance();
///
///  void setToken(String token) {
///    pref.then((value) => value.setString(AppConstants.TOKEN, token));
///  }
///
///  void setUserId(String user_id) {
///    pref.then((value) => value.setString(AppConstants.USER_ID, user_id));
///  }
///
///  int clear(){
///    pref.then((value) {
///      value.remove(AppConstants.TOKEN);
///      //value.remove(AppConstants.USER_ID);
///      value.remove(AppConstants.PASSWORD);
///      print("ran");
///    });
///    return 200;
///  }
///
///  Future<int> isTokenSet(){
///    return pref.then((value){
///      if(value.getString(AppConstants.TOKEN) != null){
///        result = 200;
///        print("isnt null");
///        //return result;
///
///      }else {
///        print("is null");
///        result = 400;
///
///      }
///      return result;
///    });
///
///  }
///}