import 'package:etv/constants.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  const AddCard({
    Key key,
    this.carditems,
  }) : super(key: key);

  final UserCard carditems;

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController cardscontroller;
  TextEditingController _cardsheaderController;
  TextEditingController _cardsdetailController;
  TextEditingController _expireyear;

  @override
  void initState() {
    cardscontroller = TextEditingController();
    _cardsheaderController = TextEditingController();
    _cardsdetailController = TextEditingController();
    _expireyear = TextEditingController();

    cardscontroller.text = widget.carditems?.city ?? '';
    _cardsheaderController.text = widget.carditems?.createdAt ?? '';
    _cardsdetailController.text = widget.carditems?.company ?? '';
    _expireyear.text = widget.carditems?.name ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(children: [
                    TextField(
                      controller: cardscontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kart Sahibi',
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _cardsheaderController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kart Numarası',
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextField(
                                controller: _cardsdetailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Ay(MM)',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: [
                              TextField(
                                controller: _expireyear,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Yıl(YY)',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ]),
                ),
                Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            // context.read<CardProvider>().addCard(
                            //   '${cardscontroller.text}',
                            //   '${_cardsheaderController.text}',
                            //   '${_cardsdetailController.text}',
                            //   '${_expireyear.text}',
                            // );
                          },
                          child: Text(
                            'Kart Ekle',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: PRIMARY_YELLOW)))
                ]),
              ],
            ),
          )),
    );
  }
}
