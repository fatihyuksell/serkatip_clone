import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:etv/app/network_manager.dart';
import 'package:etv/app/storage_manager.dart';
import 'package:etv/functions.dart';
import 'package:etv/model/etv_model/logdata_model.dart';
import 'package:etv/model/veysel_model/login_model.dart';
import 'package:etv/model/veysel_model/token_model.dart';
import 'package:etv/pages/login_page/login_ui.dart';
import 'package:etv/pages/main_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';
import '../main.dart';
import 'base_provider.dart';

class LoginProvider extends BaseProvider {

  TokenModel tokenmodelim = TokenModel();
  LoginPage loginData = LoginPage();

  Future<void> getLogin(Login requestbody) async {
    setLoading(true);
    try {
      await NetworkManager.instance.dio.post(
        '/login', 
        data: requestbody.toJson()
        ).then((value) async {
        inspect(value);
        final Map json = value.data is String ? jsonDecode(value.data) : value.data;
            LoginToken data = LoginToken.fromJson(json);
        if (value.statusCode == 200 && data?.accessToken != null) {
          StorageManager.getToken(TOKEN_KEY);
          final accessToken = StorageManager.getString('usertoken');
          log('TOKEN: ${data.accessToken}');
          StorageManager.setString('usertoken', data.accessToken);
          tokenmodelim = TokenModel.fromJson(parseJwt(data.accessToken));
          if(accessToken != null) {
            dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + accessToken;
            log('access boş değilse:$accessToken');
          }
          log('loginData:$loginData');
          Navigator.push(appKey.currentContext,MaterialPageRoute(builder: (context) => MyAppBar()));
        }
        else{
          debugPrint('hata alındı.');
        }
        log('accessToken : ${data.accessToken}');

      });
    } catch (e, s) {
      debugPrint('$e $s');
    }
    inspect(loginData);
    setLoading(false);
  }
}

  // Future<void> logout(BuildContext context, {bool home = false}) async {
  //   try {
  //     await NetworkManager.instance.dio.get('/logout');
  //   } catch (e) {
  //     debugPrint('$e');
  //   }

  //   await StorageManager.clearAuth();
  //   Future.delayed(Duration(milliseconds: !home ? 0 : 300), () {});

  //   //if (!home) Get.snackbar('Başarılı!', 'Oturumunuz kapatıldı.', snackPosition: SnackPosition.BOTTOM);
  // }

//Değiştirilmiş provider kullanımında hata bulunmaktadır. 
// class LoginProviderNew extends BaseProvider {
//   LoginPage loginData = LoginPage();

//   Future<void> getLogin(Login login) async {
//     setLoading(true);
//     try {
//       await NetworkManager.instance.dio.post('/login',).then((value) {
//         inspect(value);
//         log('giriş value :$value');
//         final Map json = value.data is String ? jsonDecode(value.data) : value.data;
//         LoginToken data = LoginToken.fromJson(json);
//         if (value.statusCode == 200 && data?.accessToken != null) {
//           StorageManager.setString('usertoken', data.accessToken);
//           Navigator.push(appKey.currentContext, MaterialPageRoute(builder: (context) => MyAppBar()));
//         }
//       });
//     } catch (e, s) {
//       debugPrint('$e $s');
//     }
//     inspect(loginData);
//     setLoading(false);
//   }
// }



// enum Status {
//   NotLoggedIn,
//   NotRegistered,
//   LoggedIn,
//   Registered,
//   Authenticating,
//   Registering,
//   LoggedOut
// }


// class AppUrl {
//   static const String liveBaseURL = "http://18.224.57.180/";

//   static const String baseURL = liveBaseURL;
//   static const String login = baseURL + "/session";
//   static const String register = baseURL + "/registration";
//   static const String forgotPassword = baseURL + "/forgot-password";
// }

// class AuthProvider with ChangeNotifier {

//   Status _loggedInStatus = Status.NotLoggedIn;
//   Status _registeredInStatus = Status.NotRegistered;

//   Status get loggedInStatus => _loggedInStatus;
//   Status get registeredInStatus => _registeredInStatus;


//   Future<Map<String, dynamic>> login(String userName, String password) async {
//     var result;

//     final Map<String, dynamic> loginData = {
//       'user': {
//         'Username': userName,
//         'password': password
//       }
//     };

//     _loggedInStatus = Status.Authenticating;
//     notifyListeners();

//     Response response = await dio.instance.post(
//       AppUrl.login,
//       body: json.encode(loginData),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = json.decode(response.body);

//       var userData = responseData['data'];

//       User authUser = User.fromJson(userData);

//       UserPreferences().saveUser(authUser);

//       _loggedInStatus = Status.LoggedIn;
//       notifyListeners();

//       result = {'status': true, 'message': 'Successful', 'user': authUser};
//     } else {
//       _loggedInStatus = Status.NotLoggedIn;
//       notifyListeners();
//       result = {
//         'status': false,
//         'message': json.decode(response.body)['error']
//       };
//     }
//     return result;
//   }

//   Future<Map<String, dynamic>> register(String email, String password, String passwordConfirmation) async {

//     final Map<String, dynamic> registrationData = {
//       'user': {
//         'email': email,
//         'password': password,
//         'password_confirmation': passwordConfirmation
//       }
//     };


//     _registeredInStatus = Status.Registering;
//     notifyListeners();

//     return await post(AppUrl.register,
//         body: json.encode(registrationData),
//         headers: {'Content-Type': 'application/json'})
//         .then(onValue)
//         .catchError(onError);
//   }

//   static Future<FutureOr> onValue(Response response) async {
//     var result;
//     final Map<String, dynamic> responseData = json.decode(response.body);

//     if (response.statusCode == 200) {

//       var userData = responseData['data'];

//       User authUser = User.fromJson(userData);

//       UserPreferences().saveUser(authUser);
//       result = {
//         'status': true,
//         'message': 'Successfully registered',
//         'data': authUser
//       };
//     } else {

//       result = {
//         'status': false,
//         'message': 'Registration failed',
//         'data': responseData
//       };
//     }

//     return result;
//   }

//   static onError(error) {
//     print("the error is $error.detail");
//     return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
//   }

// }