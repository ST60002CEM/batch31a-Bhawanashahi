import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_pet_shop/config/constant/hive_table_constant.dart';
import 'package:online_pet_shop/feature/auth/data/model/auth_hive_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../feature/contact/data/model/contact_hive_model.dart';


// Create object using a provider
final hiveServiceProvider = Provider<HiveService>(
      (ref) => HiveService(),
);

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
    // Hive.registerAdapter(BatchHiveModelAdapter());
    // Hive.registerAdapter(CourseHiveModelAdapter());
  }

  // // ======================== Batch Queries ========================
  Future<void> addBatch(ContactHiveModel contact) async {
    var box = await Hive.openBox<ContactHiveModel>(HiveTableConstant.contactBox);
    await box.put(contact.contactId, contact);
  }

  Future<List<ContactHiveModel>> getAllContacts() async {
    var box = await Hive.openBox<ContactHiveModel>(HiveTableConstant.contactBox);
    var contacts = box.values.toList();
    return contacts;
  }

  Future<void> deleteContact(String contactId) async {
    var box = await Hive.openBox<ContactHiveModel>(HiveTableConstant.contactBox);
    await box.delete(contactId);
  }

  // // ======================== Course Queries ========================
  // Future<void> addCourse(CourseHiveModel course) async {
  //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
  //   await box.put(course.courseId, course);
  // }

  // Future<List<CourseHiveModel>> getAllCourses() async {
  //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
  //   var courses = box.values.toList();
  //   return courses;
  // }

  // Future<void> deleteCourse(String courseId) async {
  //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
  //   await box.delete(courseId);
  // }

  // ======================== Auth Queries ========================

  Future<void> registerStudent(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    await box.put(auth.studentId, auth);
  }

  // Login
  Future<bool> loginStudent(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    var auths = box.values.toList();
    var auth = auths.firstWhere(
          (element) => element.email ==email && element.password == password,
      orElse: () => AuthHiveModel.empty(),
    );

    if (auth == AuthHiveModel.empty()) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<AuthHiveModel>> getAllStudents() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    var auths = box.values.toList();
    return auths;
  }

  Future<void> deleteStudent(String studentId) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    await box.delete(studentId);
  }

  // Delete hive
  Future<void> deleteHive() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);
    await Hive.deleteBoxFromDisk(HiveTableConstant.contactBox);
    // await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);
  }
}
