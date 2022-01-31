import 'package:etv/app/storage_manager.dart';
import 'package:etv/constants.dart';
import 'package:etv/functions.dart';
import 'package:etv/main.dart';
import 'package:etv/model/etv_model/nelerdahil_model.dart';
import 'package:etv/model/veysel_model/login_model.dart';
import 'package:etv/pages/login_page/login_ui.dart';
import 'package:etv/pages/main_page/buttonlist.dart';
import 'package:etv/pages/main_page/detailpage.dart';
import 'package:etv/provider/card_provider.dart';
import 'package:etv/provider/home_provider.dart';
import 'package:etv/provider/login_provider.dart';
import 'package:etv/provider/nelerdahil_provider.dart';
import 'package:etv/widget/app_textformfield.dart';
import 'package:etv/widget/define_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  TextEditingController search;

  @override
  void initState() {
    search = TextEditingController();
    nextTick(() {
      context.read<HomeProvider>().getCardforHome(
        context.read<LoginProvider>().tokenmodelim.sub.organizationName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final login = context.watch<LoginProvider>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Material(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Container(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {
                  //           if (StorageManager.auth) {
                  //             DefineModalScreen.show();
                  //           } else {
                  //             Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                  //           }
                  //         },
                  //         icon: Icon(Icons.menu),
                  //         color: Colors.black)
                  //   ],
                  // ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailPage()));
                          },
                          icon: Icon(Icons.add,size: 30),
                          color: Colors.black
                        ),
                      ],
                    ),
                  ),
                  Text('SERKATİP', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                  Row(
                    children: [
                      if(StorageManager.auth)
                      IconButton(
                        onPressed: () {
                          StorageManager.clearAuth();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LoginPage()));
                        },
                        icon: Icon(Icons.logout),
                        color: Colors.black
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              width: MediaQuery.of(context).size.width, //max width
              color: Colors.white24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Arama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                      Text('yapmak için', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                    ],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AppTextFormField(
                      placeholder: 'Arama için yazınız ...',
                      onChanged: provider.search,
                    )
                  ),
                  SizedBox(width: 20)
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Consumer<HomeProvider>(builder: (context, provider, _) {
                      if (provider.isLoading) 
                      return Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator());
                      return Column(
                          children: provider.searchcard.map((card) {
                        return ButtonList(
                          card: card,
                        );
                      }).toList());
                    }),
                  ),
                  //Text(login.tokenmodelim.toJson().toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
