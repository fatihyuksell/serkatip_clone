import 'package:etv/app/storage_manager.dart';
import 'package:etv/constants.dart';
import 'package:etv/main.dart';
import 'package:etv/modalhome.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/model/veysel_model/login_model.dart';
import 'package:etv/pages/card&adress_page/addresscreen.dart';
import 'package:etv/pages/card&adress_page/card.dart';
import 'package:etv/pages/home_order_page/order_form.dart';
import 'package:etv/pages/login_page/login_ui.dart';
import 'package:etv/pages/main_page/home.dart';
import 'package:etv/pages/questionscreen.dart';
import 'package:etv/provider/login_provider.dart';
import 'package:etv/widget/alert.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/src/provider.dart';


class DefineModalScreen extends StatefulWidget {
  const DefineModalScreen({Key key, this.carditems}) : super(key: key);

  final UserCard carditems;

  @override
  _DefineModalScreenState createState() => _DefineModalScreenState();

  static void show() {
    showCupertinoModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: (Radius.circular(10)), topRight: (Radius.circular(10))),
        ),
        context: appKey.currentContext,
        builder: (context) {
          return DefineModalScreen();
        });
  }
}

class _DefineModalScreenState extends State<DefineModalScreen> {
  @override
  Widget build(BuildContext context) {
    final loginprovider = context.read<LoginProvider>();

    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Kişi Listeleme', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: PRIMARY_GRAY))],
            ),
            ProfileActionItem(
              title: 'Adresler',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
              },
            ),
            ProfileActionItem(
              title: 'My Cards',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_) => CardScreen()));
              },
            ),
            ProfileActionItem(
              title: 'Çıkıs',
              onTap: () {
                StorageManager.clearAuth();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
