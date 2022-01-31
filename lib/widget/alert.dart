import 'package:etv/constants.dart';
import 'package:etv/main.dart';
import 'package:flutter/material.dart';
import 'package:etv/pages/main_page/home.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key key}) : super(key: key);

  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    content: Stack(
      children: [
        Container(
          height: 100,
          child:Center(
            child: Image.asset('assets/images/rectangle.png')),
        ),
        Container(
          height: 100,
          child:Center(child: Image.asset('assets/images/dirty.png')),
        ),
        
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Ödeme işlemi başarısız oldu. Lütfen farklı bir kredi kartı deneyin.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TamamButton()),
        ],
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class TamamButton extends StatelessWidget {
  const TamamButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(appKey.currentContext);
        },
        child: Text('Tamam',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
        style: ElevatedButton.styleFrom(primary: PRIMARY_YELLOW));
  }
}
