// class StudentM {
//   int? id;
//   late String names;
//   late String courses;
//
//   StudentM({this.id, required this.names, required this.courses});
//   Map<String,dynamic>toMap(){
//     return {
//       "names":names,
//       "courses":courses
//     };
//   }
// }
class Dodetails {
  int? id;
  late String name, blood;
  dynamic email, age, phone;

  Dodetails(
      {
        this.id,
        required this.name,
        required this.age,
        required this.phone,
        required this.email,
        required this.blood});
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "age": age,
      "phone": phone,
      "blood": blood,
      "email": email,
    };
  }
}