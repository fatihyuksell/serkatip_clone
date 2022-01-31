import 'dart:developer';

import 'package:animated_button/animated_button.dart';
import 'package:etv/model/etv_model/logdata_model.dart';
import 'package:etv/model/etv_model/usercard_model.dart';
import 'package:etv/provider/home_provider.dart';
import 'package:etv/provider/login_provider.dart';
import 'package:etv/widget/app_button.dart';
import 'package:etv/widget/app_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DetailPage extends StatefulWidget {
  final UserCard user;
  const DetailPage({Key key, this.user}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController note = TextEditingController();

  bool isEnabled = true;
 
  enableElevatedButton() {
    setState(() {
      isEnabled = true;
    });
  }
 
  disableElevatedButton() {
    setState(() {
      isEnabled = false;
    });
  }

  sampleFunction(){
    print('Clicked');
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.user != null) {
      name.text = widget.user.name;
      surname.text = widget.user.surname;
      phonenumber.text = widget.user.phoneNumber;
      company.text = widget.user.company;
      job.text = widget.user.job;
      city.text = widget.user.city;
      website.text = widget.user.website;
      note.text = widget.user.note;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final loginprovider = context.read<HomeProvider>();

    String guncelleme = 'GÜNCELLEME';
    String ekleme = "EKLEME";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detay Bilgileri',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.yellow),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          RichText(text: TextSpan(text: 'Buradan ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black), children: <TextSpan>[TextSpan(text: '$guncelleme', style: TextStyle(fontSize: 12, color: Colors.red[800], fontWeight: FontWeight.bold)), TextSpan(text: ' veya '), TextSpan(text: '$ekleme', style: TextStyle(fontSize: 12, color: Colors.red[800], fontWeight: FontWeight.bold)), TextSpan(text: ' yapılabilmektedir.')])),
                          Icon(Icons.sync_sharp),
                        ],
                      ),
                    ),
                    // child: Text(
                    //   'Burası $guncelleme sayfasıdır.\n Kişisel bilgileri buradan yenileyebilirsiniz.',
                    //   style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: Colors.black),
                    // )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  AppTextFormField(placeholder: 'Adı', controller: name),
                  SizedBox(height: 15),
                  AppTextFormField(placeholder: 'Soyadı', controller: surname),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 150, child: AppTextFormField(placeholder: 'Telefon Numarası', controller: phonenumber)),
                      Container(
                        child: AnimatedButton(
                          height: 50,
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Arama Yap',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.call,color: Colors.white),
                            ],
                          ),
                          onPressed: () {
                            loginprovider.callNumber(phonenumber.text);
                            //https://medium.flutterdevs.com/implementing-phone-calls-using-the-flutter-app-e350ea275c92
                          },
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  AppTextFormField(placeholder: 'Şirket', controller: company),
                  SizedBox(height: 15),
                  AppTextFormField(placeholder: 'Meslek', controller: job),
                  SizedBox(height: 15),
                  AppTextFormField(placeholder: 'Şehir', controller: city),
                  SizedBox(height: 15),
                  AppTextFormField(placeholder: 'Website', controller: website),
                  SizedBox(height: 15),
                  AppTextFormField(placeholder: 'Notlar', controller: note),
                  SizedBox(height: 15),
                  AppButton(
                    onTap: () {
                      var user = UserCard(
                        name: name.text,
                        surname: surname.text,
                        phoneNumber: phonenumber.text,
                        company: company.text,
                        job: job.text,
                        city: city.text,
                        website: website.text,
                        note: note.text,
                        createdAt: DateTime.now().toIso8601String(),
                        organizationName: context.read<LoginProvider>().tokenmodelim.sub.organizationName,
                      );
                      if (widget.user != null) {
                        user.id= widget.user.id;
                        isEnabled ? () => disableElevatedButton() : sampleFunction();
                        context.read<HomeProvider>().editCard(user);
                        return;
                      } else {
                        context.read<HomeProvider>().addCard(user);
                        isEnabled ? () => disableElevatedButton(): sampleFunction();                  
                        return;
                      }
                    },
                    title: (widget.user != null) ?  'Güncelle' : 'Ekle',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//