import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

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
}
