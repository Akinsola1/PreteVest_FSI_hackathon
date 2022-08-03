// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:side_navigation/side_navigation.dart';

// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /// You can use an AppBar if you want to
//       //appBar: AppBar(
//       //  title: const Text('App'),
//       //),

//       // The row is needed to display the current view
//       body: Row(
//         children: [
//           /// Pretty similar to the BottomNavigationBar!
//           SideNavigationBar(
//             selectedIndex: selectedIndex,
//             items: const [
//               SideNavigationBarItem(
//                 icon: Icons.dashboard,
//                 label: 'Dashboard',
//               ),
//               SideNavigationBarItem(
//                 icon: Icons.person,
//                 label: 'Account',
//               ),
//               SideNavigationBarItem(
//                 icon: Icons.settings,
//                 label: 'Settings',
//               ),
//             ],
//             onTap: (index) {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//           ),

//           /// Make it take the rest of the available width
//           Expanded(
//             child: views.elementAt(selectedIndex),
//           )
//         ],
//       ),
//     );
//   }
// }