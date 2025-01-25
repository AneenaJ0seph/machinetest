// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // import '../../database/database.dart';
// // import '../../database/model.dart';
// //
// // class Newadmission extends StatefulWidget {
// //   @override
// //   _NewadmissionState createState() => _NewadmissionState();
// // }
// //
// // class _NewadmissionState extends State<Newadmission> {
// //   final DatabaseService dbStudentManager = DatabaseService();
// //   final _nameController = TextEditingController();
// //   final _courseController = TextEditingController();
// //   final _formkey = GlobalKey<FormState>();
// //   StudentM? student;
// //   late int updateindex;
// //
// //   late List<StudentM> studlist;
// //   TextEditingController _editnameController=TextEditingController();
// //   TextEditingController _editcourseController=TextEditingController();
// //
// //
// //   void _showalert(BuildContext context){
// //     showDialog(
// //       barrierDismissible: false,
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Column(
// //             children: [
// //               TextField(
// //                 controller: _editnameController,
// //                 decoration: InputDecoration(
// //                     label: Text("Name"),
// //                     border: OutlineInputBorder()
// //                 ),
// //               ),
// //               TextField(
// //                 controller: _editcourseController,
// //                 decoration: InputDecoration(
// //                     label: Text("Course"),
// //                     border: OutlineInputBorder()
// //                 ),
// //               )
// //             ],
// //           ),
// //
// //
// //           actions: [
// //             ElevatedButton(onPressed: (){
// //               student?.names=_editnameController.text;
// //               student?.courses=_editcourseController.text;
// //               dbStudentManager.updateStudent(student!).then((onValue){
// //                 _nameController.clear();
// //                 _courseController.clear();
// //               });
// //               Navigator.pop(context);
// //
// //             }
// //
// //                 , child: Text("Update")),
// //
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Flutter Sqflite Example"),
// //       ),
// //       body: ListView(
// //         children: <Widget>[
// //           Form(
// //             key: _formkey,
// //             child: Padding(
// //               padding: const EdgeInsets.all(12.0),
// //               child: Column(
// //                 children: <Widget>[
// //                   TextFormField(
// //                     decoration: InputDecoration(labelText: "Name"),
// //                     controller: _nameController,
// //                     validator: (val) =>
// //                     val!.isNotEmpty ? null : "Name Should not be Empty",
// //                   ),
// //                   TextFormField(
// //                     decoration: InputDecoration(labelText: "Course"),
// //                     controller: _courseController,
// //                     validator: (val) =>
// //                     val!.isNotEmpty ? null : "Course Should not be Empty",
// //                   ),
// //                   ElevatedButton(
// //                     child: Container(
// //                         width: width * 0.9,
// //                         child: Text(
// //                           "Submit",
// //                           textAlign: TextAlign.center,
// //                         )),
// //                     onPressed: () {
// //                       if(_formkey.currentState!.validate()){
// //                         dbStudentManager.insertStudent(StudentM(names: _nameController.text, courses: _courseController.text)).then((onValue){
// //                           _nameController.clear();
// //                           _courseController.clear();
// //                         });
// //                       }
// //                     },
// //                   ),
// //
// //                   Container(
// //                     height: 500,
// //                     child: FutureBuilder(future: dbStudentManager.getStudentList(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
// //                       if(snapshot.hasData){
// //                         return ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (BuildContext context, int index) {
// //                           return ListTile(
// //                             title: Text("${snapshot.data[index].names}"),
// //                             leading: CircleAvatar(
// //
// //                               child: Text("${snapshot.data[index].names[0]}"),
// //                             ),
// //                             trailing: Padding(
// //                               padding: const EdgeInsets.only(left: 230),
// //                               child: Row(
// //                                 children: [
// //                                   IconButton(onPressed: () {
// //                                     student=snapshot.data![index];
// //                                     _showalert(context);
// //                                   }, icon: Icon(Icons.edit),),
// //                                   IconButton(onPressed: (){}, icon: Icon(Icons.delete))
// //
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         },);
// //                       }
// //                       else if(snapshot.hasError){
// //                         return Center(child: Text("Error"));
// //                       }
// //                       else{
// //                         return Center(child: CircularProgressIndicator());
// //                       }
// //                     },),
// //                   )
// //                   // FutureBuilder(
// //                   //   future: dbStudentManager.getStudentList(),
// //                   //   builder: (context, snapshot) {
// //                   //     if (snapshot.hasData) {
// //                   //       studlist = snapshot.data as List<Student>;
// //                   //       return ListView.builder(
// //                   //         shrinkWrap: true,
// //                   //         itemCount: studlist == null ? 0 : studlist.length,
// //                   //         itemBuilder: (BuildContext context, int index) {
// //                   //           Student st = studlist[index];
// //                   //           return Card(
// //                   //             child: Row(
// //                   //               children: <Widget>[
// //                   //                 Padding(
// //                   //                   padding: const EdgeInsets.all(16.0),
// //                   //                   child: SizedBox(
// //                   //                     width: width * 0.50,
// //                   //                     child: Column(
// //                   //                       children: <Widget>[
// //                   //                         Text('ID: ${st.id}'),
// //                   //                         Text('Name: ${st.names}'),
// //                   //                       ],
// //                   //                     ),
// //                   //                   ),
// //                   //                 ),
// //                   //                 IconButton(
// //                   //                   onPressed: () {
// //                   //                     _nameController.text = st.names;
// //                   //                     _courseController.text = st.courses;
// //                   //                     student = st;
// //                   //                     updateindex = index;
// //                   //                   },
// //                   //                   icon: const Icon(
// //                   //                     Icons.edit,
// //                   //                     color: Colors.blue,
// //                   //                   ),
// //                   //                 ),
// //                   //                 IconButton(
// //                   //                   onPressed: () {
// //                   //                     dbStudentManager.deleteStudent(st.id);
// //                   //                     setState(() {
// //                   //                       studlist.removeAt(index);
// //                   //                     });
// //                   //                   },
// //                   //                   icon: Icon(
// //                   //                     Icons.delete,
// //                   //                     color: Colors.red,
// //                   //                   ),
// //                   //                 ),
// //                   //               ],
// //                   //             ),
// //                   //           );
// //                   //         },
// //                   //       );
// //                   //     }
// //                   //     else if(snapshot.hasError){
// //                   //       return Text("Error");
// //                   //     }
// //                   //     else
// //                   //       return CircularProgressIndicator();
// //                   //   },
// //                   // )
// //                 ],
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void submitStudent(BuildContext context) {
// //     if (_formkey.currentState!.validate()) {
// //       if (student == null) {
// //         StudentM st = StudentM(names: _nameController.text, courses: _courseController.text);
// //         dbStudentManager.insertStudent(st).then((onValue){
// //           _nameController.clear();
// //           _courseController.clear();
// //         });
// //       } else {
// //         student?.names = _nameController.text;
// //         student?.courses = _courseController.text;
// //
// //         dbStudentManager.updateStudent(student!).then((value) {
// //           setState(() {
// //             studlist[updateindex].names = _nameController.text;
// //             studlist[updateindex].courses = _courseController.text;
// //           });
// //           _nameController.clear();
// //           _courseController.clear();
// //           student = null;
// //         });
// //       }
// //     }
// //   }
// // }
// import 'package:flutter/material.dart';
// import '../../database/database_helper.dart';
//
// class NewAdmissionScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _rollNoController = TextEditingController();
//   final _classController = TextEditingController();
//   final _genderController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//               validator: (value) => value!.isEmpty ? 'Enter name' : null,
//             ),
//             TextFormField(
//               controller: _rollNoController,
//               decoration: InputDecoration(labelText: 'Roll No'),
//               validator: (value) => value!.isEmpty ? 'Enter roll number' : null,
//             ),
//             TextFormField(
//               controller: _classController,
//               decoration: InputDecoration(labelText: 'Class'),
//               validator: (value) => value!.isEmpty ? 'Enter class' : null,
//             ),
//             TextFormField(
//               controller: _genderController,
//               decoration: InputDecoration(labelText: 'Gender'),
//               validator: (value) => value!.isEmpty ? 'Enter gender' : null,
//             ),
//             TextFormField(
//               controller: _mobileController,
//               decoration: InputDecoration(labelText: 'Mobile'),
//               validator: (value) => value!.isEmpty ? 'Enter mobile' : null,
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               validator: (value) => value!.isEmpty ? 'Enter email' : null,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   await DatabaseHelper.instance.insertStudent({
//                     'name': _nameController.text,
//                     'rollNo': int.parse(_rollNoController.text),
//                     'className': _classController.text,
//                     'gender': _genderController.text,
//                     'mobile': _mobileController.text,
//                     'email': _emailController.text,
//                   });
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Student added successfully!')),
//                   );
//                   _formKey.currentState!.reset();
//                 }
//               },
//               child: Text('Add Student'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cydexflutter_mach/ui/home/students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/database.dart';
import '../../database/model.dart';

class NewAdmissionScreen extends StatefulWidget {
  const NewAdmissionScreen({super.key});

  @override
  State<NewAdmissionScreen> createState() => _NewAdmissionScreenState();
}

class _NewAdmissionScreenState extends State<NewAdmissionScreen> {
  final DatabaseService dbStudentManager = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bloodController = TextEditingController();
  final bdgroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String ? selectgroup ;

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birthdate';
    }
    // Additional validation can be added here
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateBlood(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your blood group';
    }
    // Additional validation can be added here
    return null;
  }

  Dodetails? donner;
  late List<Dodetails> donnlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New addmission",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Enter Name",
                    iconColor: Colors.grey.shade700,
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: _validateName,
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Enter Rollno",
                    iconColor: Colors.grey.shade700,
                    labelText: "Rollno",
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  validator: _validateAge,
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Enter Phone",
                    iconColor: Colors.grey.shade700,
                    labelText: "Phone",
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: _validatePhone,
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Enter Email",
                    iconColor: Colors.grey.shade700,
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: _validateEmail,
                ),
                SizedBox(height: 25),
                // TextFormField(
                //   controller: _bloodController,
                //   decoration: InputDecoration(
                //     fillColor: Colors.white,
                //     filled: true,
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10))),
                //     hintText: "Enter Blood group",
                //     iconColor: Colors.grey.shade700,
                //     labelText: "Blood group",
                //     prefixIcon: Icon(Icons.bloodtype),
                //   ),
                //   validator: _validateBlood,
                // ),
                SizedBox(height: 35),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // If the form is valid, display a snackbar or perform some action
                      //   // ScaffoldMessenger.of(context).showSnackBar(
                      //   //   SnackBar(content: Text('Processing Data')),
                      //   // );
                      // }
                      if (_formKey.currentState!.validate()) {
                        dbStudentManager
                            .insertDonner(Dodetails(
                            name: _nameController.text,
                            age: _ageController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            blood: _bloodController.text))
                            .then((onValue) {
                          _nameController.clear();
                          _ageController.clear();
                          _phoneController.clear();
                          _emailController.clear();
                          _bloodController.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentListScreen()),
                          );
                        });
                      }
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Color(0xffD9D9D9),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 6,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
