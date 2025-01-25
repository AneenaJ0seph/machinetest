import 'package:cydexflutter_mach/ui/attendencepage/widgets.dart';
import 'package:flutter/material.dart';

import '../profile.dart';
import '../results.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    HomePage(),
    const RecordsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   title: const Text("Records"),
      //   leading: const Icon(Icons.arrow_back),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Records"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home Page",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Records"),
          leading: const Icon(Icons.arrow_back),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Attendance"),
              Tab(text: "Exam"),
              Tab(text: "Result"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const AttendancePage(),
            const ExamPage(),
            ResultPage(),
          ],
        ),
      ),
    );
  }
}


class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AttendanceSection(),
          const SizedBox(height: 20),
          WeeklyReportSection(),
          const SizedBox(height: 20),
          OverviewSection(),
        ],
      ),
    );
  }
}

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Exam Page",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
