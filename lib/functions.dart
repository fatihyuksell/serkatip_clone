import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



//test

nextTick(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (callback != null)
      Future.delayed(Duration(milliseconds: 25), () {
        callback();
      });
  });
}

Map<String, dynamic> parseJwt(String token) {
    if (token != null && token.isNotEmpty && token != '') {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('invalid token');
      }
      final payload = _decodeBase64(parts[1]);
      final payloadMap = jsonDecode(payload);
      if (payloadMap is! Map<String, dynamic>) {
        throw Exception('invalid payload');
      }
      return payloadMap;
    } else {
      return {"Hata": "Token Data Boş"};
    }
  }
String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!“');
    }
    return utf8.decode(base64Url.decode(output));
}

// *s
// launchWhatsApp(String link) async {
//   try {
//     if (await canLaunch('$link')) {
//       await launch('$link');
//     } else {
//       throw Exception;
//     }
//   } catch (e) {
//     AppDialog.show2(buttonText: 'Tamam', content: 'Whatsapp uygulaması açılamadı');
//   }
// }

// launchLink(String link) async {
//   try {
//     if (await canLaunch('$link')) {
//       await launch('$link');
//     } else {
//       throw Exception;
//     }
//   } catch (e) {
//     AppDialog.show2(buttonText: 'Tamam', content: 'Linke yönlendirilirken hata oluştu.');
//   }
// }

// bool validateTC(String tc) {
//   if (tc.length != 11) return false;

//   if (tc.substring(0, 1) == '0') {
//     return false;
//   } else {
//     int o, th, f, s, n, tw, fr, sx, ei;
//     o = int.parse(tc[0]);
//     th = int.parse(tc[2]);
//     f = int.parse(tc[4]);
//     s = int.parse(tc[6]);
//     n = int.parse(tc[8]);
//     tw = int.parse(tc[1]);
//     fr = int.parse(tc[3]);
//     sx = int.parse(tc[5]);
//     ei = int.parse(tc[7]);

//     int calcOtfsn = (o + f + th + s + n) * 7;
//     int calcTwfrsxei = tw + fr + sx + ei;

//     int eleventh = (o + f + th + s + n + tw + fr + sx + ei + int.parse(tc[9])) % 10;

//     int tenth = (calcOtfsn - calcTwfrsxei) % 10;
//     if (int.parse(tc[9]) == tenth && int.parse(tc[10]) == eleventh) return true;
//     return false;
//   }
// }

// ///onlyDate true olursa saati dönmüyor
// ///onlyTime true olursa sadece saati dönüyor
// String formatDate(String date, {bool onlyDate = false, bool onlyTime = false}) {
//   try {
//     //DateFormat('EEEE').format(yourDate);
//     // DateFormat(onlyTime ? 'kk:mm' : 'dd MMM yyyy, EEEE${!onlyDate ? ' – kk:mm' : ''}');

//     return DateFormat(onlyTime ? 'kk:mm' : 'dd MMM yyyy, EEE${!onlyDate ? ' – kk:mm' : ''}', 'tr').format(DateTime.tryParse(date));
//   } catch (e) {
//     return date;
//   }
// }

// void hideKeyboard(BuildContext context) {
//   try {
//     FocusScope.of(context).unfocus();
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
//   } catch (e, s) {
//     debugPrint('$e, $s');
//   }
// }

// void showAppSnackbar({String title, String content, int duration = 4000}) {
//   Get.snackbar(
//     '$title',
//     '$content.',
//     duration: Duration(milliseconds: duration),
//     backgroundColor: PRIMARY_YELLOW.withOpacity(.4),
//     snackPosition: SnackPosition.TOP,
//     margin: EdgeInsets.symmetric(vertical: 32, horizontal: 12),
//   );
// }

// String decodeBase64(String str) {
//   String output = str.replaceAll('-', '+').replaceAll('_', '/');

//   switch (output.length % 4) {
//     case 0:
//       break;
//     case 2:
//       output += '==';
//       break;
//     case 3:
//       output += '=';
//       break;
//     default:
//       throw Exception('Illegal base64url string!"');
//   }

//   return utf8.decode(base64Url.decode(output));
// }

// Map<String, dynamic> parseJwt(String token) {
//   if (token != null && token.isNotEmpty && token != '') {
//     final parts = token.split('.');
//     if (parts.length != 3) {
//       throw Exception('invalid token');
//     }

//     final payload = decodeBase64(parts[1]);
//     final payloadMap = jsonDecode(payload);
//     if (payloadMap is! Map<String, dynamic>) {
//       throw Exception('invalid payload');
//     }

//     return payloadMap;
//   } else {
//     return {"Hata": "Token Data Boş"};
//   }
// }

// String listToString(List<String> items, {String delimiter = ','}) {
//   try {
//     String _return = "";

//     for (final item in items) {
//       if (items.indexOf(item) != items.length - 1) {
//         _return += (item + ',');
//       } else {
//         _return += item;
//       }
//     }
//     return _return;
//   } catch (e) {
//     return "";
//   }
// }

