import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/repository.dart';
import '../utils/app_constants.dart';
import 'disk_provider.dart';
//write a future provider

final authModelProvider = StateNotifierProvider<AuthNotifier, AuthModel>(
        (ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(defaultState);

  static const defaultState = AuthModel('name','email','password','c_password');

  void fillAuthModel( Map<String, dynamic> body) {
    state = AuthModel(
        body['name'],
        body['email'],
        body['password'],
        body['c_password']);
    print("allegedky filled");
  }
}

class AuthModel {
  const AuthModel(this.name, this.email, this.password, this.c_password);
  final String name;
  final String email;
  final String password;
  final String c_password;

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "c_password": c_password,
  };

}

/**
 *
 *
 *
 * Register Cluster
 *
 *
 *
 */
final isLoadingProviderForSignUpPage = StateProvider<bool>((ref) => false);

final signUpPageProvider = FutureProvider<dynamic>((ref) async{
  final AuthModel body = ref.watch(authModelProvider);
  final diskController = ref.watch(diskDataProvider);
  print("body: ${body.toJson()}");
  final Map<String, dynamic> bodyHelp = body.toJson(); //
  return ref.watch(repository).post(AppConstants.REGISTER_URI ,bodyHelp).then(
          (value) async {
        print("value: ${value}");
        print(jsonEncode(value['success']));

      }
  );
});
/**
 * End of Register Cluster
 *
 *
 *
 *
 *
 *
 * Start of Login Cluster
 */
final isLoadingProviderForSignInPage = StateProvider<bool>((ref) => false);

final signInPageProvider = FutureProvider<dynamic>((ref) async{
  final AuthModel body = ref.watch(authModelProvider);
  final diskController = ref.watch(diskDataProvider);
  print("body: ${body.toJson()}");
  final Map<String, dynamic> bodyHelp = body.toJson(); //
  return ref.watch(repository).post(AppConstants.LOGIN_URI ,bodyHelp).then(
          (value) async {
        print("value: ${value}");
        print(jsonEncode(value['success']));
        if(jsonEncode(value['success']) != "true"){///Guard
          print("server failure");
          return 400;
        }
        else{
          print("success");
          final data = value['data'];
          final String token = data['token']['plainTextToken'];
          print("token: ${token}");///Sets token in disk/ AppConstants
          diskController.setToken(token);
          ref.watch(repository).updateHeaders(token);///updates headers in fintechRepository
          print("token updated");
          ///
          ///
          diskController.setName(data['name']);
          print(data['id'].toString());
          diskController.setUserId(data['id'].toString());

        }
      }
  );
});


final logoutProvider = Provider<int>((ref) {
  final diskData = ref.watch(diskDataProvider);
  int clearStatus = diskData.clear();
  if(clearStatus == 200){
    print("cleared in clearstatus");
    ref.watch(repository).updateHeaders('');///updates token header to '' in fintechRepository
    return 200;
  }
  return 400;
});