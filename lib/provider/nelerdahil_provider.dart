import 'dart:convert';
import 'dart:developer';
import 'package:etv/app/network_manager.dart';
import 'package:etv/model/etv_model/cleaning_model.dart';
import 'package:etv/model/etv_model/nelerdahil_model.dart';
import 'package:flutter/widgets.dart';
import 'base_provider.dart';


class NelerDahilProvider extends BaseProvider {

  Nelerdahil myData = Nelerdahil();


  Future<void> getDataaa({String static = 'neler-dahil'}) async {

    setLoading(true);
    try{
      await NetworkManager.instance.dio.get('/static-content/$static').then((value) {
        final Map json = value.data is String ? jsonDecode(value.data) : value.data;
        myData = Nelerdahil.fromJson(json);
      });
    }catch(e,s){
      debugPrint('$e $s');
    }
    inspect(myData);
    setLoading(false);
    
  }
}


