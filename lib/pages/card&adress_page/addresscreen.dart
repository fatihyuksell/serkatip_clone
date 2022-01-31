import 'package:etv/pages/card&adress_page/add_address.dart';
import 'package:etv/constants.dart';
import 'package:etv/functions.dart';
import 'package:etv/main.dart';
import 'package:etv/model/etv_model/adress_model.dart';
import 'package:etv/provider/address_provider.dart';
import 'package:etv/app/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:etv/widget/slidable_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key key,
    this.adresitem,
  }) : super(key: key);

  final Address adresitem;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController addresscontroller;
  List<Address> addresses;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextTick((){
      context.read<AdressProvider>().getAdress();
    });
  }

  //final provider = context.watch<MainScreen>();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdressProvider>();


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
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
                  Image.asset('assets/images/flag_tr.png',
                      height: 70, width: 70),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      //   child: Container(
      //     height: 60.0,
      //     width: double.infinity,
      //     child: ElevatedButton(
      //       onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           return AddAddress();
      //         }));
      //       },
      //       style: ElevatedButton.styleFrom(
      //           primary: Color.fromRGBO(252, 219, 5, 5)),
      //       child: Text(
      //         'Adres Ekle',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //             fontWeight: FontWeight.w400,
      //             fontSize: 15.0,
      //             color: Colors.black),
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Consumer<AdressProvider>(builder: (context, provider, _) {
        if (provider.isLoading) return Center(child: CircularProgressIndicator());
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Adreslerim',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: PRIMARY_GRAY))
                  ],
                ),
                SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: provider.addresses.map((e) {
                          return Slidable(
                             endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  label: 'sil',
                                  backgroundColor: Colors.red[700],
                                  foregroundColor: Colors.red[500],
                                  onPressed: (MainScreen) {
                                    context
                                      .read<AdressProvider>()
                                      .removeAddress(e.id);
                                  },
                                icon: Icons.delete,
                              ),
                              ],
                            ),
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // one card
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                      title: Text('${e.name}',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: PRIMARY_GRAY),),
                                      subtitle: Text('${e.address}'),
                                          
                                      trailing: ElevatedButton(
                                          onPressed: () {
                                            //if(appKey.currentState != ){};
                                            // if(addresses.isNotEmpty){};
                                            // context
                                            //     .read<AdressProvider>()
                                            //     .updateAddress(e.id,'a','b','c');
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return AddAddress(adresim: e);
                                            }));
                                          },
                                          child: Text(
                                            'Düzenle',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.black),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(2.0),
                                                      side: BorderSide(color: Colors.yellow[600])))))),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddAddress();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(252, 219, 5, 5)),
                    child: Text(
                      'Adres Ekle',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

