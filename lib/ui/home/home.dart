// import 'package:cydexflutter_mach/ui/home/students.dart';
// import 'package:flutter/material.dart';
//
// import 'admission.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//
//             Container(
//               decoration: BoxDecoration(
//                 color:Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search data...',
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//
//               ),
//             ),
//             SizedBox(height: 15,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Newadmission(),
//                       ),
//                     );
//                   },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//                       child: Text("New Admission",style: TextStyle(color: Colors.white),),
//                     ),
//                   ),
//                   SizedBox(width: 10,),
//                   ElevatedButton(onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Students(),
//                       ),
//                     );
//                   },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//                       child: Text("Our Students",style: TextStyle(color: Colors.black),),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cydexflutter_mach/ui/home/students.dart';
import 'package:flutter/material.dart';

import 'admission.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    NewAdmissionScreen(),
    StudentListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New Admission',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Our Students',
          ),
        ],
      ),
    );
  }
}
