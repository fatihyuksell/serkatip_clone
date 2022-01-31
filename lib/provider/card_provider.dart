// import 'dart:convert';
// import 'dart:developer';

// import 'package:etv/app/network_manager.dart';
// import 'package:etv/main.dart';
// import 'package:etv/model/etv_model/usercard_model.dart';
// import 'package:etv/provider/base_provider.dart';
// import 'package:flutter/material.dart';

// class CardProvider extends BaseProvider {
//   List<UserCard> cards = [];
//   List<UserCard> addcards = [];

//   Future<void> getCard() async {
//     setLoading(true);
//     try {
//       await NetworkManager.instance.dio.get('/contacts/veysel/$cards').then((value) {
//         inspect(value);
//         final List json =
//             value.data is String ? jsonDecode(value.data) : value.data;
//         cards = [];
//         json.forEach((card) {
//           cards.add(UserCard.fromJson(card));
//         });
//         notifyListeners();
//         if (value.statusCode == 200) {}
//       });
//     } catch (e, s) {
//       debugPrint('$e $s');
//     }
//     inspect(cards);
//     setLoading(false);
//   }





//   Future<void> addCard(String cardName,String cardNumber, String expireMonth, String expireYear) async {
//     setLoading(true);
//     try {
//       await NetworkManager.instance.dio.post('/user/card', data:
//         {
//           "cardName": cardName,
//           "cardNumber": cardNumber,
//           "expireMonth": expireMonth,
//           "expireYear": expireYear
//         }
//       ).then((value){
//         inspect(value);
//         if(value.statusCode == 200){
//           getCard();
//           Navigator.pop(appKey.currentContext);
//         }
//       });
//     } catch (e, s) {
//       debugPrint('$s $e');
//     }
//     inspect(addcards);
//     setLoading(false);
//   }

//   Future<void> removeCard(int id) async {
//     setLoading2(true);
//     try {
//       await NetworkManager.instance.dio.delete('/user/card/$id', data: {
//         }).then((value) {
//         inspect(value);
//         if (value.statusCode == 200) {
//           getCard();
//         }
//       });
//     } catch (e, s) {
//       debugPrint('$e $s');
//     }
//     inspect(cards);
//     setLoading2(false);
//   }
// }
