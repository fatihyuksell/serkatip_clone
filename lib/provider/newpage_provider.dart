import 'dart:convert';
import 'dart:developer';
import 'package:etv/app/network_manager.dart';
import 'package:etv/model/etv_model/cleaning_model.dart';
import 'package:etv/model/etv_model/products_model.dart';
import 'package:flutter/widgets.dart';
import 'base_provider.dart';


class NewpageProvider extends BaseProvider {

  Cleaning myContent = Cleaning();


  Future<void> getDataa({String slug = 'ev-temizligi'}) async {

    setLoading(true);
    try{
      await NetworkManager.instance.dio.get('/product/$slug').then((value) {
        final Map json = value.data is String ? jsonDecode(value.data) : value.data;
        myContent = Cleaning.fromJson(json);
      });
    }catch(e,s){
      debugPrint('$e $s');
    }
    inspect(myContent);
    setLoading(false);
  }
}

