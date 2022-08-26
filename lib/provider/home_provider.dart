import 'dart:convert';
import 'dart:developer';
import 'package:etv/app/network_manager.dart';
import 'package:etv/main.dart';
import 'package:etv/model/etv_model/logdata_model.dart';
import 'package:etv/model/etv_model/products_model.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/model/veysel_model/token_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'base_provider.dart';

class HomeProvider extends BaseProvider {
  String organizationName;

  List<UserCard> cards = [];
  List<UserCard> searchcard = [];
  List<UserCard> addcards = [];

  Future<void> getCardforHome(String organizationName) async {
    setLoading(true);
    try {
      await NetworkManager.instance.dio
          .get('/contacts/${organizationName}')
          .then((value) {
        this.organizationName = organizationName;
        inspect(value);
        final List json =
            value.data is String ? jsonDecode(value.data) : value.data;
        cards = [];
        json.forEach((card) {
          cards.add(UserCard.fromJson(card));
        });
        searchcard = cards;
        notifyListeners();
        if (value.statusCode == 200) {}
      });
    } catch (e, s) {
      debugPrint('$e $s');
    }
    inspect(cards);
    setLoading(false);
  }

  Future<void> addCard(UserCard user) async {
    setLoading(true);
    //insert + 200 dön
    try {
      //log(user.toJson().toString());
      await NetworkManager.instance.dio
          .post('/contacts/${user.organizationName}', data: user.toJson())
          .then((value) async {
        inspect(value);
        if (value.statusCode == 200) {
          await getCardforHome(organizationName);
          Navigator.pop(appKey.currentContext);
        } else {
          throw Exception('HATA!!!!!!!!!');
        }
      });
    } catch (e, s) {
      debugPrint('$s $e');
      //ALERT BAS İSTERSEN!!!
    }
    inspect(addcards);
    setLoading(false);
  }

  Future<void> editCard(UserCard user) async {
    setLoading(true);
    //insert + 200 dön
    try {
      log(user.toJson().toString());
      await NetworkManager.instance.dio
          .put('/contacts/${user.organizationName}/${user.id}',
              data: user.toJson())
          .then((value) async {
        inspect(value);
        log(jsonEncode(user.toJson()));
        if (value.statusCode == 200) {
          await getCardforHome(organizationName);
          Navigator.pop(appKey.currentContext);
        } else {
          throw Exception('HATA!!!!!!!!!');
        }
      });
    } catch (e, s) {
      debugPrint('$s $e');
      //ALERT BAS İSTERSEN!!!
    }
    inspect(addcards);
    setLoading(false);
  }

  Future<void> removeCard(dynamic id) async {
    setLoading2(true);
    try {
      await NetworkManager.instance.dio.delete('/contacts/veysel/$id', data: {
        'id': id,
      }).then((value) {
        inspect(value);
        if (value.statusCode == 200) {
          getCardforHome(organizationName);
        }
      });
    } catch (e, s) {
      debugPrint('$e $s');
    }
    inspect(cards);
    setLoading2(false);
  }

  void search(String val) {
    searchcard = cards
        .where((element) =>
            (element.name.toLowerCase().contains(val.toLowerCase())) ||
            (element.surname.toLowerCase().contains(val.toLowerCase())) ||
            (element.phoneNumber.toLowerCase().contains(val.toLowerCase())) ||
            (element.city.toLowerCase().contains(val.toLowerCase())) ||
            (element.job.toLowerCase().contains(val.toLowerCase())))
        .toList();

    notifyListeners();
  }

  void callNumber(number) async {
    String num = number;
    await FlutterPhoneDirectCaller.callNumber(num);
  }

  // List<ProductsModel> datass= [];

  // Future<void> getData() async {

  //   setLoading(true);
  //   await NetworkManager.instance.dio.get('/contacts/veysel',).then((value) {
  //     final List<dynamic> json = value.data is String ? jsonDecode(value.data) : value.data;
  //     json.forEach((e){
  //       datass.add(ProductsModel.fromJson(e));
  //     });
  //   });
  //   inspect(datass);
  //   log('getData Home Provider dan gelmektedir');
  //   setLoading(false);

  // }
}
