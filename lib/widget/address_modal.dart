import 'package:etv/pages/card&adress_page/addresscreen.dart';
import 'package:etv/widget/alert.dart';
import 'package:etv/constants.dart';
import 'package:etv/main.dart';
import 'package:etv/modalhome.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/provider/card_provider.dart';
import 'package:etv/app/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';

class AddressModalScreen extends StatefulWidget {
  const AddressModalScreen({Key key, this.ilceler}) : super(key: key);

  final UserCard ilceler;

  @override
  _AddressModalScreenState createState() => _AddressModalScreenState();

  static void show() {
    showCupertinoModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: (Radius.circular(10)), topRight: (Radius.circular(10))),
        ),
        context: appKey.currentContext,
        builder: (context) {
          return AddressModalScreen();
        });
  }
}

class _AddressModalScreenState extends State<AddressModalScreen> {

  final ilceler = [
    'BESIKTAS',
    'USKUDAR',
    'KADIKOY',
    'ATASEHIR',
  ];

  int index = 0;

  // void _showPicker(BuildContext ctx) {
  //   showCupertinoModalPopup(
  //       context: ctx,
  //       builder: (_) => Container(
  //             width: 300,
  //             height: 250,
  //             child: CupertinoPicker(
  //               backgroundColor: Colors.white,
  //               itemExtent: 30,
  //               scrollController: FixedExtentScrollController(initialItem: 1),
  //               children: [
  //                 Text('0'),
  //                 Text('1'),
  //                 Text('2'),
  //               ],
  //               onSelectedItemChanged: (value) {
  //                 setState(() {
  //                   value = value;
  //                 });
  //               },
  //             ),
  //           ));
  // }
 
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //içeriyi içerikle doldur. İPTAL VE TAMAM VS........
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('İptal')),
                TextButton(onPressed: (){
                  //Girilen Değerin içeriye set edilmesi setState

                }, child: Text('Tamam')),
              ]
            ),
            SizedBox(
              height:150,
              child: CupertinoPicker(
                itemExtent: 65,
                children: ilceler.map((item) => Center(child: Text(item))).toList(), //text style vermek için burayı kullanalım.
                onSelectedItemChanged: (index) {
                  setState((){
                    this.index=index;
                  });
                  final item = ilceler[index];
                  print(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
