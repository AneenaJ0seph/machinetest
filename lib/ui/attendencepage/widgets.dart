
import 'package:flutter/material.dart';

class AttendanceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AttendanceCard(label: "Check in Bus", time: "08:24AM", icon: Icons.directions_bus),
          AttendanceCard(label: "Check out Bus", time: "-", icon: Icons.directions_bus),
          AttendanceCard(label: "Clock in Class", time: "09:04AM", icon: Icons.school),
          AttendanceCard(label: "Clock out Class", time: "-", icon: Icons.school),
        ],
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;

  const AttendanceCard({
    required this.label,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class WeeklyReportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: Text("Weekly",style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: Text("Monthly",style: TextStyle(color: Colors.black),),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Weekly Report",style: TextStyle(fontSize: 19,color: Colors.black,),),
              Row(
                children: const [
                  Icon(Icons.arrow_back, size: 18),
                  Text(" 21 March - 27 March "),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 200,
            color: Colors.grey[200],
            child: const Center(child: Text("Bar Chart Placeholder")),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Legend(label: "Present", color: Colors.teal),
                Legend(label: "Absent", color: Colors.red),
                Legend(label: "Holiday", color: Colors.yellow),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {

              },
              icon: Icon(Icons.person_add_alt),
              label: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text('Apply leave',style: TextStyle(color: Colors.teal),),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.teal, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

class Legend extends StatelessWidget {
  final String label;
  final Color color;

  const Legend({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}


class OverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.calendar_month, color: Colors.teal),
              SizedBox(width: 10),
              Text("Thursday (09:00AM - 04:15PM)", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Present", style: TextStyle(color: Colors.green)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("Details Placeholder")),
          ),
        ],
      ),
    );
  }
}
