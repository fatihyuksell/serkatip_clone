import 'package:etv/app/storage_manager.dart';
import 'package:etv/pages/splashscreen.dart';
import 'package:etv/provider/address_provider.dart';
import 'package:etv/provider/card_provider.dart';
import 'package:etv/provider/faq_provider.dart';
import 'package:etv/provider/home_provider.dart';
import 'package:etv/provider/nelerdahil_provider.dart';
import 'package:etv/provider/newpage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etv/provider/login_provider.dart';


final GlobalKey appKey = GlobalKey<NavigatorState>();

void main() {
  runApp(App());
}

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  @override
  void initState() {
    // TODO: implement initState
    StorageManager.initPrefs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => NewpageProvider()),
        ChangeNotifierProvider(create: (_) => NelerDahilProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AdressProvider()),
        // ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => FaqProvider()),
      ],
      
      child: MaterialApp(
        navigatorKey: appKey,
        debugShowCheckedModeBanner: false,
        title: 'ETV HOME',
        theme: ThemeData(
          primarySwatch: Colors.blue, fontFamily: 'Avenir'
        ),
        home: SplashScreen(),//SplashScreen(),
      ),
    );
  }
}
