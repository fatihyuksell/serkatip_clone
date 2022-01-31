import 'package:etv/app/storage_manager.dart';
import 'package:etv/constants.dart';
import 'package:etv/pages/login_page/login_ui.dart';
import 'package:etv/provider/faq_provider.dart';
import 'package:etv/widget/define_modal.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({ Key key }) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FaqProvider>().getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Material(
          color:Colors.blue[800].withOpacity(0.4),
          elevation:2,
          child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/etvlogo.png',
                          height: 70, width: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                if(StorageManager.auth){
                                  DefineModalScreen.show();
                                }else{
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                                }
                              },
                              icon: Icon(Icons.menu),
                              color: Colors.grey)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
      body: Consumer<FaqProvider>(builder:(context, provider,_){
        if(provider.isLoading) return Center(child:CircularProgressIndicator());
        return Container(
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sıkça Sorulan Sorular', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color:PRIMARY_GRAY))
                  ],
                ),
                SizedBox(height:15),
                Expanded(
                  child: SingleChildScrollView(
                    child:Container(
                      child:Column(
                        children: provider.faqs.map((e){
                          return Card(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ExpansionTile(
                                  title:Text('${e.title}',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: PRIMARY_GRAY)),
                                  children: <Widget>[
                                    ListTile(title: Text('${e.content}',style: TextStyle(fontSize: 12,  color: PRIMARY_GRAY))),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ); 
      })
      
    );
  }
}