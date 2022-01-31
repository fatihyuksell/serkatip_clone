import 'package:etv/functions.dart';
import 'package:etv/provider/home_provider.dart';
import 'package:etv/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  void initState() {
    super.initState();
    nextTick((){
        context.read<HomeProvider>().getCardforHome();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    //final provider = context.watch<LoginProvider>();
    return Container(
      child: Material(
        child: Consumer<LoginProvider>(builder: (context, provider, _) {
          if (provider.isLoading) return CircularProgressIndicator();
          return Material(
            child: Text(provider.loginData.toString())
          );
        }),
      ),
    );
  }
}
