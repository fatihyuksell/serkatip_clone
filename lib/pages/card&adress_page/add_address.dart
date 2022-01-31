import 'dart:async';
import 'package:etv/pages/card&adress_page/addresscreen.dart';
import 'package:etv/constants.dart';
import 'package:etv/model/etv_model/adress_model.dart';
import 'package:etv/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({
    Key key,
    this.adresim,
  }) : super(key: key);

  final Address adresim;

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController addresscontroller;
  TextEditingController _addressheaderController;
  TextEditingController _addressdetailController;

  @override
  void initState() {
    addresscontroller = TextEditingController();
    _addressheaderController = TextEditingController();
    _addressdetailController = TextEditingController();

    addresscontroller.text = widget.adresim?.address ?? '';
    _addressheaderController.text = widget.adresim?.name ?? '';
    _addressdetailController.text = widget.adresim?.address ?? '';
    super.initState();
  }

  String _dropDownValue;
  String ilcevalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Adres Ekle',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: PRIMARY_GRAY)),
                            IconButton(
                                //widget fazla yer tutuyor widget icon arası boşlukları kaldır.
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close))
                          ]),
                    ),
                    SizedBox(height: 10),
                    Column(children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _addressheaderController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: PRIMARY_GRAY_LIGHT)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: PRIMARY_GRAY_LIGHT),
                                  ),
                                  labelText: 'Adres Başlığı',
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('İl',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: PRIMARY_GRAY)),
                                Container(
                                  child: DropdownButton<String>(
                                    value: ilcevalue,
                                    isExpanded: true,
                                    items: <String>[
                                      'İstanbul',
                                      'Ankara',
                                      'İzmir'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value,
                                            style:
                                                TextStyle(color: Colors.black)),
                                      );
                                    }).toList(),
                                    onChanged: (_) {
                                      setState(() {
                                        ilcevalue = _;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('İlçe',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: PRIMARY_GRAY)),
                                DropdownButton<String>(
                                  value: _dropDownValue,
                                  isExpanded: true,
                                  items: <String>[
                                    'Feneryolu',
                                    'Şişli',
                                    'Beşiktaş'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value,
                                          style:
                                              TextStyle(color: Colors.black)),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _dropDownValue = value;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ]),
                    Column(children: [
                      TextField(
                        controller: _addressdetailController,
                        //maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: PRIMARY_GRAY_LIGHT)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_GRAY_LIGHT),
                          ),
                          labelText: 'Açık Adres Tarifi',
                        ),
                      )
                    ]),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                //adres null değilse güncelleme at, null se add adres istek
                                if (widget.adresim != null) {
                                  context.read<AdressProvider>().updateAddress(
                                      widget.adresim.id,
                                      '${_addressheaderController.text}',
                                      '${_addressdetailController.text}',
                                      '');
                                } else {
                                  context.read<AdressProvider>().addAdress(
                                      '${_addressheaderController.text}',
                                      '${_addressdetailController.text}',
                                      '');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(252, 219, 5, 5)),
                              child: Text(
                                'Kaydet',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: PRIMARY_GRAY),
                              ),
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
        ),
      ),
    );
  }
}
