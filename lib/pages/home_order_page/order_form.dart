import 'package:etv/widget/address_modal.dart';
import 'package:etv/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key key}) : super(key: key);

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  String option1;
  String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.grey),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Toplam', style: TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_GRAY)), Text('0 TL', style: TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_GRAY))],
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: PRIMARY_YELLOW),
                      child: Text('Devam Et', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
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
                  Image.asset('assets/images/etvlogo.png', height: 70, width: 70),
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
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Image.asset('assets/icons/home.png'), SizedBox(width: 10), Text('Ev Temizliği', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: PRIMARY_GRAY))],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('İl', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Seçiniz...', style: TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                                  Icon(Icons.arrow_drop_down, color: PRIMARY_GRAY),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('İlçe', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                          Container(
                            child: ElevatedButton(
                              //INKWELL KULLLANILMASI DAHA DOĞRU
                              onPressed: () {
                                AddressModalScreen.show();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Seçiniz...', style: TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                                  Icon(Icons.arrow_drop_down, color: PRIMARY_GRAY),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tarih', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Seçiniz...', style: TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                                  Icon(Icons.arrow_drop_down, color: PRIMARY_GRAY),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Saat', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: PRIMARY_GRAY)),
                          Container(
                            child: ElevatedButton(
                              //INKWELL KULLLANILACAKTI DALMIŞIM :)
                              onPressed: () {
                                AddressModalScreen.show();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Seçiniz...', style: TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                                  Icon(Icons.arrow_drop_down, color: PRIMARY_GRAY),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Icon(Icons.watch_later_sharp, color: Colors.yellow[800]), SizedBox(width: 10), Text('Temizlik Sıklığı', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: PRIMARY_GRAY))],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Haftada Bir', style: TextStyle(fontSize: 13, color: PRIMARY_GRAY)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Tek Sefer', style: TextStyle(fontSize: 13, color: PRIMARY_GRAY)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Paket', style: TextStyle(fontSize: 13, color: PRIMARY_GRAY)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

// DropdownButton<String>(
//                     value: option1,
//                     items:<String>['ASDFGH','QWERTY','ABCDEF'].map(
//                       (String value){
//                       return DropdownMenuItem<String>(
//                         value:value,
//                         child: Text(value),
//                       );
//                   } ).toList(),
//                   onChanged: (_){
//                     setState((){
//                       option1 = _;
//                     });
//                   },
//                 ),