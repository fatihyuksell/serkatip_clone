import 'package:etv/app/storage_manager.dart';
import 'package:etv/constants.dart';
import 'package:etv/model/etv_model/logdata_model.dart';
import 'package:etv/model/veysel_model/login_model.dart';
import 'package:etv/pages/main_page/home.dart';
import 'package:etv/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  TextEditingController usernamecontroller, organizationcontroller, pwcontroller, accesstoken;

  void validate() {
    if (formkey.currentState.validate()) {
      print('Validated');
    } else {
      print('Not Validated');
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  void initState() {
    organizationcontroller = TextEditingController();
    usernamecontroller = TextEditingController();
    pwcontroller = TextEditingController();
    accesstoken = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    organizationcontroller.dispose();
    usernamecontroller.dispose();
    pwcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //appBar için dosya oluşturup defAppBar() şeklinde kullanalım !
        preferredSize: Size.fromHeight(80),
        child: Material(
          color: Colors.blue[800].withOpacity(0.4),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Container(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50),
                  Text('Serkatip',style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w900,overflow:TextOverflow.ellipsis),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            debugPrint('cıkıs yaptık');
                            if(StorageManager.auth){
                              Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context) => MyAppBar()));
                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage()));
                              Dialog();
                            }
                          },
                          icon: Icon(Icons.close),
                          color: Colors.black)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow[200].withOpacity(0.2),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Giriş Yap',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: PRIMARY_GRAY),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT),
                                    ),
                                    labelText: "Organizasyon",
                                  ),
                                  controller: organizationcontroller,
                                  validator: (value) {
                                    return value.isEmpty ? "Please enter an organization name" : null;
                                  }),
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT),
                                    ),
                                    labelText: "Kullanıcı Adı",
                                  ),
                                  controller: usernamecontroller,
                                  validator: (value) {
                                    return value.isEmpty ? "Please enter an username" : null;
                                  }),
                            ),
                            SizedBox(height: 30),
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: true,
                                  cursorColor: PRIMARY_GRAY,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT),
                                    ),
                                    labelText: "Şifre",
                                  ),
                                  controller: pwcontroller,
                                  validator: (value) {
                                    return value.length > 3 ? null : "Please enter a password please!";
                                  }),
                            ),
                          ],
                        ),
                      ),
                      // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      //   TextButton(onPressed: () {}, child: Text('Şifremi Unuttum', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 11, color: PRIMARY_GRAY))),
                      // ]),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formkey.currentState.validate()) {
                                      print("Success");
                                      context.read<LoginProvider>().getLogin(
                                            Login(
                                              organizationName: organizationcontroller.text,
                                              username: usernamecontroller.text,
                                              password: pwcontroller.text,
                                            ),
                                        
                                          );
                                    } else {
                                      print("Error");
                                    }
                                  },
                                  //row sar indicator
                                  child: Text('Giriş Yap', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Colors.black)),
                                  style: ElevatedButton.styleFrom(primary: Colors.blue[800].withOpacity(0.4))
                              )
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20, bottom: 10),
                      //   child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      //     Text('Henüz üye değil misin?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: PRIMARY_GRAY)),
                      //   ]),
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: ElevatedButton(onPressed: () {}, child: Text('Üye Ol', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)), style: ElevatedButton.styleFrom(primary: Colors.white, side: BorderSide(width: 2.0, color: PRIMARY_YELLOW))),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
