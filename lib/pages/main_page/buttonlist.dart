import 'dart:developer';
import 'package:etv/constants.dart';
import 'package:etv/model/etv_model/products_model.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/pages/main_page/detailpage.dart';
import 'package:etv/provider/home_provider.dart';
import 'package:etv/provider/newpage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../newpage.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ButtonList extends StatefulWidget {
  final UserCard card;
  const ButtonList({
    Key key,
    this.card,
    this.item,
  }) : super(key: key);

  final ProductsModel item;
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController surname = TextEditingController();
    TextEditingController phonenumber = TextEditingController();
    TextEditingController company = TextEditingController();
    TextEditingController job = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController website = TextEditingController();
    TextEditingController note = TextEditingController();


    final provider = context.watch<HomeProvider>();
    
    @override
    void initState() {
      if(widget.card!=null){
            name.text = widget.card.name;
      surname.text = widget.card.surname;
      phonenumber.text = widget.card.phoneNumber;
      company.text = widget.card.company;
      job.text = widget.card.job;
      city.text = widget.card.city;
      website.text = widget.card.website;
      note.text = widget.card.note;
      }
      super.initState();
      
    }


    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(user: widget.card)));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFFFFF),
                  elevation: 5,
                  shadowColor: Colors.grey.shade50,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Image.asset(
                        //   'assets/images/flag_tr.png',
                        //   width: 35,
                        //   height: 35,
                        // ),
                        Row(
                          children: [
                            SizedBox(width:20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Ad : ',style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text('Soyad : ',style: TextStyle(color: Colors.black)),
                                SizedBox(height: 5),
                                Text('Tel : ',style: TextStyle(color: Colors.black)),
                                // Text('Job : ',style: TextStyle(color: Colors.black)),
                                // Text('Company : ',style: TextStyle(color: Colors.black)),
                                // Text('City : ',style: TextStyle(color: Colors.black)),
                                // Text('Website : ',style: TextStyle(color: Colors.black)),
                                // Text('Note : ',style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${widget?.card?.name}' ?? '', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                                SizedBox(height: 5),
                                Text('${widget?.card?.surname}' ?? '', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                                SizedBox(height: 5), 
                                Text('${widget?.card?.phoneNumber}' ?? '', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: PRIMARY_GRAY)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(onPressed: (){
                         log(widget.card.id);
                      provider.removeCard(widget.card.id);
                   
                    }, icon: Icon(Icons.delete,color: Colors.black,)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
