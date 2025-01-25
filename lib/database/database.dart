// import 'dart:async';
// import 'package:path/path.dart';
//
// import 'package:sqflite/sqflite.dart';
//
// import 'model.dart';
//
//
//
// class DatabaseService {
//   late Database _datebase;
//
//   Future openDB() async {
//     _datebase = await openDatabase(
//       //external storage path/dbname is the actual path to join this join maethod of path  package is used
//         join(await getDatabasesPath(), "student.db"),
//         version: 1,
//         // ee version code il ini student.db ennu mattoru db create cheyyan ptttilla
//         onCreate: (Database db, int version) async {
//           await db.execute("CREATE TABLE studenttable(id INTEGER PRIMARY KEY AUTOINCREMENT,names TEXT,courses TEXT)");
//         }
//     );
//   }
//
//   Future<int> insertStudent(StudentM student)   async {
//     await openDB();
//     //insersion success anenkil +ve int return varum illenkil -ve int return varum
//     return await _datebase.insert('studenttable', student.toMap());
//   }
//
//   Future<List<StudentM>> getStudentList()  async {
//     await openDB();
//     final List<Map<String, dynamic>> maps = await _datebase.query('studenttable');
//     return List.generate(maps.length,
//             (index) {
//           return StudentM(
//               id: maps[index]['id'],
//               names: maps[index]['names'],
//               courses: maps[index]['courses']);
//         });
//   }
//
//   Future<int> updateStudent(StudentM student) async {
//     await openDB();
//     return await _datebase.update('studenttable', student.toMap(),
//         where: 'id=?', whereArgs: [student.id]);
//   }
//
//   Future<void> deleteStudent(int? id) async {
//     await openDB();
//     await _datebase.delete("studenttable", where: "id = ? ", whereArgs:[id]);
//   }
// }
import 'dart:async';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import 'model.dart';

class DatabaseService {
  late Database _datebase;

  Future<void>openDB()  async {
    _datebase = await openDatabase(
      //external storage path/dbname is the actual path to join this join maethod of path  package is used
        join(await getDatabasesPath(), "donner.db"),
        version: 1,
        // ee version code il ini student.db ennu mattoru db create cheyyan ptttilla
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE donnertable(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age TEXT,phone TEXT,email TEXT,blood TEXT)");
        });
  }

  Future<int> insertDonner(Dodetails donner) async {
    await openDB();
    //insersion success anenkil +ve int return varum illenkil -ve int return varum
    return await _datebase.insert('donnertable', donner.toMap());
  }
  Future<int> deleteDonner(int id) async {
    await openDB();
    // Deletion success anenkil +ve int return varum, illenkil -ve int return varum
    return await _datebase.delete(
      'donnertable',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<int> updateDonner(Dodetails donner) async {
    await openDB();
    // Update success anenkil +ve int return varum, illenkil -ve int return varum
    return await _datebase.update(
      'donnertable',
      donner.toMap(),
      where: 'id = ?',
      whereArgs: [donner.id],
    );
  }


  Future<List<Dodetails>> getStudentList() async {
    await openDB();
    final List<Map<String, dynamic>> maps =
    await _datebase.query('donnertable');
    return List.generate(maps.length, (index) {
      return Dodetails(
        id: maps[index]['id'],
        name: maps[index]['name'],
        age: maps[index]['age'],
        email: maps[index]['email'],
        phone: maps[index]['phone'],
        blood: maps[index]['blood'],
      );
    });
  }

// Future<int> updateStudent(Dodetails donner) async {
//   await openDB();
//   return await _datebase.update('donnertable', donner.toMap(),
//       where: 'id=?', whereArgs: [donner.id]);
// }

// Future<void> deleteStudent(int? id) async {
//   await openDB();
//   await _datebase.delete("donnertable", where: "id = ? ", whereArgs: [id]);
// }
}
