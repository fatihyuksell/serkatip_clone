// import 'package:etv/pages/card&adress_page/add_card.dart';
// import 'package:etv/pages/card&adress_page/addcardmodal.dart';
// import 'package:etv/constants.dart';
// import 'package:etv/pages/main_page/home.dart';
// import 'package:etv/main.dart';
// import 'package:etv/model/etv_model/usercard_model.dart';
// import 'package:etv/provider/card_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class CardScreen extends StatefulWidget {
//   const CardScreen({
//     Key key,
//     this.carditems,
//   }) : super(key: key);

//   final UserCard carditems;

//   @override
//   _CardScreenState createState() => _CardScreenState();
// }

// class _CardScreenState extends State<CardScreen> {
//   TextEditingController cardscontroller;
//   TextEditingController _cardsheaderController;
//   TextEditingController _cardsdetailController;
//   TextEditingController _expireyear;
//   List<UserCard> cards;

//   @override
//   void initState() {
//     cardscontroller = TextEditingController();
//     _cardsheaderController = TextEditingController();
//     _cardsdetailController = TextEditingController();
//     _expireyear = TextEditingController();

//     cardscontroller.text = widget.carditems?.city ?? '';
//     _cardsheaderController.text = widget.carditems?.createdAt ?? '';
//     _cardsdetailController.text = widget.carditems?.company ?? '';
//     _expireyear.text = widget.carditems?.name ?? '';
//     super.initState();
//     // context.read<CardProvider>().getCard();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80),
//         child: Material(
//           elevation: 1,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
//             child: Container(
//               width: double.infinity,
//               height: 100,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset('assets/images/flag_tr.png',
//                       height: 70, width: 70),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Navigator.pop(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (BuildContext context) =>
//                                         MyAppBar()));
//                             debugPrint('cıkıs yaptık aslında');
//                           },
//                           icon: Icon(Icons.close),
//                           color: Colors.grey)
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Consumer<CardProvider>(builder: (context, provider, _) {
//         if (provider.isLoading) return Center(child: CircularProgressIndicator());
//         return Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Kartlarım',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//                 SizedBox(height: 15),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Container(
//                       child: Column(
//                         children: provider.cards.map((e) {
//                           return Slidable(
//                             endActionPane: ActionPane(
//                               motion: ScrollMotion(),
//                               dismissible: DismissiblePane(onDismissed: () {}),
//                               children: [
//                                 SlidableAction(
//                                   label: 'sil',
//                                   backgroundColor: Colors.red[700],
//                                   foregroundColor: Colors.red[500],
//                                   onPressed: (CardScreen) {
//                                     //context.read<CardProvider>().removeCard(e.id);
//                                   },
//                                 icon: Icons.delete,
//                               ),
//                               ],
//                             ),
//                             child: Card(
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween, // one card
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   ListTile(
//                                     leading: SvgPicture.asset(
//                                         'assets/icons/${e.name == 'MASTER_CARD' ? 'icon-mastercard' : 'icon-visa'}.svg',
//                                         width: 50,
//                                         height: 50),
//                                     title: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text('\n' + '${e.city}',
//                                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: PRIMARY_GRAY),),
//                                         Text('${e.name}' + '\n',
//                                             style: TextStyle(fontSize: 12)),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       ModalScreen.show();
//                     },
//                     style: ElevatedButton.styleFrom(primary: PRIMARY_YELLOW),
//                     child: Text(
//                       'Kart Ekle',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: PRIMARY_GRAY),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
