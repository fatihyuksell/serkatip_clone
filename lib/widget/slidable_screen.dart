// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';


// class SlidableScreen extends StatefulWidget {
//   const SlidableScreen({ Key key }) : super(key: key);

//   @override
//   _SlidableScreenState createState() => _SlidableScreenState();
// }

// class _SlidableScreenState extends State<SlidableScreen> {
//   SlidableController _slidableController;
//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       endActionPane: ActionPane(
//         motion: ScrollMotion(),
//         children: [
//           SlidableAction(
//             label: 'More',
//             backgroundColor: Colors.grey.shade200,
//             foregroundColor: Colors.red[500],
//             autoClose: false,
//             onPressed: doNothing,
//             icon: Icons.more_horiz,
//           ),
//         ],
//       ),
//       // child: SlidableDrawerDismissal(),
//       // controller: _slidableController,
//       // secondaryActions: <Widget>[
//       //   IconSlideAction(
//       //     caption: 'More',
//       //     color: Colors.grey.shade200,
//       //     icon: Icons.more_horiz,
//       //     closeOnTap: false,
//       //   ),
//       //   IconSlideAction(
//       //     caption: 'Delete',
//       //     color: Colors.red,
//       //     icon: Icons.delete,
//       //   ),
//       // ],
//       child: ListTile(),
//       direction: Axis.horizontal,
      
//     );
//   }
// }
// void doNothing(BuildContext context) {}