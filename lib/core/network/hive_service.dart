import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../config/constant/hive_table_constant.dart';
import '../../feature/auth/data/model/auth_hive_model.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  // Future<void> init() async {
  //   var directory = await getApplicationDocumentsDirectory();
  //   Hive.init(directory.path);
  //
  //   Hive.registerAdapter(BatchHiveModelAdapter());
  //   Hive.registerAdapter(CourseHiveModelAdapter());
  // }
  //
  // //=========================Batch Queries========================
  // Future<void> addBatch(BatchHiveModel batch) async{
  //   var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
  //   await box.put(batch.batchId, batch);
  // }
  //
  // Future<List<BatchHiveModel>> getAllBatches() async {
  //   var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
  //   return box.values.toList();
  // }
  //
  // //=========================Course Queries========================
  // Future<void> addCourse(CourseHiveModel course) async{
  //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
  //   await box.put(course.courseId, course);
  // }
  //
  // Future<List<CourseHiveModel>> getAllCourses() async {
  //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
  //   return box.values.toList();
  // }
  Future<void> registerStudent(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.id, auth);
  }

  // Login
  Future<bool> loginStudent(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var auths = box.values.toList();
    var auth = auths.firstWhere(
          (element) => element.email == username && element.password == password,
      orElse: () => AuthHiveModel.empty(),
    );

    if (auth == AuthHiveModel.empty()) {
      return false;
    } else {
      return true;
    }
  }


  Future<void> deleteStudent(String studentId) async {
    // var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    // await box.delete(studentId);
  }

  // Delete hive
  Future<void> deleteHive() async {
    // await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);
    // await Hive.deleteBoxFromDisk(HiveTableConstant.batchBox);
    // await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);

}

}
