import 'dart:convert';
import 'dart:developer';

import 'package:etv/app/network_manager.dart';
import 'package:etv/model/etv_model/faq_model.dart';
import 'package:etv/provider/base_provider.dart';
import 'package:flutter/material.dart';

class FaqProvider extends BaseProvider {

  // FaqModel faq = FaqModel();

  List<FaqModel> faqs = [];

  Future<void> getFaq() async{
    setLoading(true);
    try{
      await NetworkManager.instance.dio.get('/faq').then((value){
        final List json = value.data is String ? jsonDecode(value.data): value.data;
        // faq = FaqModel.fromJson(json);
        json.forEach((faq) {
          faqs.add(FaqModel.fromJson(faq));
        });
        notifyListeners();
        if (value.statusCode == 200) {}
      });
    }catch(e,s){
      debugPrint('$e $s');
    }
    inspect(faqs);
    setLoading(false);
  }
}