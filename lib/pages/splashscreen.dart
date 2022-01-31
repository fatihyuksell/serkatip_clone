
import 'package:etv/pages/login_page/login_ui.dart';
import 'package:etv/pages/main_page/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (_){
        //token varsa ana sayfa yoksa login
        return LoginPage();
      }) );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


//yonlendirme, adres listeleme olcak 1 