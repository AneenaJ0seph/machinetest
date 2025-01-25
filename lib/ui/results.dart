import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quarterly Examination',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Start: 15-11-2024'),
                      SizedBox(height: 8),
                      Text('End: 28-11-2024'),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Overall: Good'),
                          Column(
                            children: [
                              Text('Total Marks'),
                              Text(
                                '350/500',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SubjectRow('Tamil', '76/100', 'A+', 'Pass'),
                          SubjectRow('English', '76/100', 'A+', 'Pass'),
                          SubjectRow('Maths', '76/100', 'A+', 'Pass'),
                          SubjectRow('Science', '76/100', 'A+', 'Pass'),
                          SubjectRow('Social', '76/100', 'A+', 'Pass'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    label: Text('Share',style: TextStyle(color: Colors.black),),

                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                    label: Text('Download',style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

class SubjectRow extends StatelessWidget {
  final String subject;
  final String marks;
  final String grade;
  final String status;

  SubjectRow(this.subject, this.marks, this.grade, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subject),
          Text(marks),
          Text(grade),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: TextStyle(color: Colors.green[700]),
            ),
          ),
        ],
      ),
    );
  }
}
