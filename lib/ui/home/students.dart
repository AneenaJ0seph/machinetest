import 'package:flutter/material.dart';

import '../../database/database.dart';
import '../../database/model.dart';
import 'admission.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final DatabaseService dbStudentManager = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Student List",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the New Admission screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewAdmissionScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: dbStudentManager.getStudentList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Dodetails>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(child: Text("No students found."));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final student = snapshot.data![index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              student.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              children: [
                                // Edit Button
                                IconButton(
                                  onPressed: () {
                                    _editStudent(context, student);
                                  },
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                ),
                                // Delete Button
                                IconButton(
                                  onPressed: () async {
                                  //  await _deleteStudent(student.id);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("Age: ${student.age}"),
                        SizedBox(height: 10),
                        Text("Phone: ${student.phone}"),
                        SizedBox(height: 10),
                        Text("Email: ${student.email}"),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong: ${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // Edit Student Function
  void _editStudent(BuildContext context, Dodetails student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController nameController =
        TextEditingController(text: student.name);
        final TextEditingController ageController =
        TextEditingController(text: student.age.toString());
        final TextEditingController phoneController =
        TextEditingController(text: student.phone);
        final TextEditingController emailController =
        TextEditingController(text: student.email);

        return AlertDialog(
          title: Text("Edit Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone"),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedStudent = Dodetails(
                  id: student.id,
                  name: nameController.text,
                  age: int.parse(ageController.text),
                  phone: phoneController.text,
                  email: emailController.text,
                  blood: student.blood, // Retain other properties
                );
                await dbStudentManager.updateDonner(updatedStudent);
                setState(() {}); // Refresh the list
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // Delete Student Function
  Future<void> _deleteStudent(int id) async {
    await dbStudentManager.deleteDonner(id);
    setState(() {}); // Refresh the list
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Student deleted successfully")),
    );
  }
}
