import 'package:etv/constants.dart';
import 'package:etv/main.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ModalScreen extends StatefulWidget {
  const ModalScreen({Key key, this.carditems}) : super(key: key);

  final UserCard carditems;

  @override
  _ModalScreenState createState() => _ModalScreenState();

  static void show() {
    showCupertinoModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: (Radius.circular(10)), topRight: (Radius.circular(10))),
        ),
        context: appKey.currentContext,
        builder: (context) {
          return ModalScreen();
        });
  }
}

class _ModalScreenState extends State<ModalScreen> {
  TextEditingController cardscontroller;
  TextEditingController _cardsheaderController;
  TextEditingController _cardsdetailController;
  TextEditingController _expireyear;
  List<UserCard> cards;

  @override
  void initState() {
    cardscontroller = TextEditingController();
    _cardsheaderController = TextEditingController();
    _cardsdetailController = TextEditingController();
    _expireyear = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Kart Ekle',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(appKey.currentContext);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: cardscontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kart Sahibi',
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _cardsheaderController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kart Numarası',
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: _cardsdetailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ay(MM)',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: _expireyear,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Yıl(YY)',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        // context.read<CardProvider>().addCard(
                        //       '${cardscontroller.text}',
                        //       '${_cardsheaderController.text}',
                        //       '${_cardsdetailController.text}',
                        //       '${_expireyear.text}',
                        //     );
                      },
                      child: Text(
                        'Kart Ekle',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: PRIMARY_YELLOW)))
            ]),
          ],
        ),
      ),
    );
  }
}
