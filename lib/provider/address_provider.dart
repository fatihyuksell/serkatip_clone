import 'dart:convert';
import 'dart:developer';
import 'package:etv/app/network_manager.dart';
import 'package:etv/main.dart';
import 'package:etv/model/etv_model/adress_model.dart';
import 'package:flutter/material.dart';
import 'base_provider.dart';

class AdressProvider extends BaseProvider {
  List<Address> addresses = [];
  List<Address> addaddress = [];

  Future<void> getAdress() async {
    setLoading(true);
    try {
      await NetworkManager.instance.dio.get('/contacts/veysel').then((value) {
        inspect(value);
        final List json =
            value.data is String ? jsonDecode(value.data) : value.data;
        addresses = [];
        json.forEach((address) {
          addresses.add(Address.fromJson(address));
        });
        notifyListeners();
        if (value.statusCode == 200) {}
      });
    } catch (e, s) {
      debugPrint('$e $s');
    }
    inspect(addresses);
    setLoading(false);
  }

  Future<void> addAdress(String name, String address, String describe) async {
    setLoading1(true);
    try {
      await NetworkManager.instance.dio.post('/user/address', data: {
          "name": name,
          "city": 34,
          "district":12,
          "town": 4,
          "address": address,
          "describe": describe
      }).then((value) {
        inspect(value);
        if (value.statusCode == 200) {
          getAdress();
          Navigator.pop(appKey.currentContext);
        }
        else{
          getAdress();
          log('CARD BİLGİLERİNİ AUTH HARİCİ GETİTDİM.');
        }
      });
    } catch (e, s) {
      debugPrint('$e $s');
    }
    inspect(addresses);
    setLoading1(false);
  }
  Future<void> removeAddress(int id) async {
    setLoading2(true);
    try {
      await NetworkManager.instance.dio.delete('/user/address/$id', data: {
      }).then((value) {
        inspect(value);
        if (value.statusCode == 200) {
          getAdress();
        }
      });
    } catch (e, s) {
      debugPrint('$e $s');
    }
    inspect(addresses);
    setLoading2(false);
  }

  Future<void> updateAddress(int id,String name, String address, String describe) async {
  await NetworkManager.instance.dio.put('/user/address/$id',data:{
          "name": name,
          "city": 34,
          "district":12,
          "town": 4,
          "address": address,
          "describe": describe
      }).then((value){
    inspect(value);
    if (value.statusCode == 200) {
      getAdress();
      Navigator.pop(appKey.currentContext);
  } else {
      throw Exception('Failed to update personal informations.');
  }
  });
  notifyListeners(); //UI da veriyi güncel görüntüler. State yenilenir.
  }
}
  