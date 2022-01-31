import 'package:dio/dio.dart';
import 'package:etv/app/storage_manager.dart';
import 'package:etv/pages/main_page/home.dart';
import 'package:etv/main.dart';
import 'package:etv/provider/base_provider.dart';
import 'package:etv/app/storage_manager.dart';
import 'package:flutter/material.dart';

class NetworkManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Dio dio;
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance ?? NetworkManager.instance;
  }

  NetworkManager._init() {
    dio = Dio();
    dio.options.sendTimeout = 20000; //12s
    dio.options.receiveTimeout = 20000; //12s
    dio.options.contentType = 'application/json';
    dio.options.baseUrl = 'http://18.224.57.180';
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request,handle){
        final token = StorageManager.getString('usertoken');
        print(token);
        if(token != '' ){
          request.headers['Authorization'] = 'Bearer '+ token;
        }
        print(request.baseUrl+request.path);
        handle.next(request);
        print('Network Manager da on Request ten token geçmiştir. $token');
      },
      onError: (err,handle){
        if(err?.response?.statusCode == 401){
          print('401 ERROR');
        }
        print('Status: ${err?.response?.statusCode} ERR: ${err?.response?.data}'); //statusCode was called on null???
        handle.next(err);
      }
    ));
  }

  void unauthorized() async {
    StorageManager.clearAuth();
    Navigator.push(appKey.currentContext , MaterialPageRoute(builder: (context) => MyAppBar()));
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppBar()));
    //home a gönder, appkey.current context 
  }
}

