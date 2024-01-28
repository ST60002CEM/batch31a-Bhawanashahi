import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../config/constant/hive_table_constant.dart';
import '../../feature/auth/data/model/auth_hive_model.dart';
import '../../feature/contact/data/model/contact_hive_model.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(AuthHiveModelAdapter());

    // Hive.registerAdapter(BatchHiveModelAdapter());
    // Hive.registerAdapter(CourseHiveModelAdapter());
  }
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
  Future<void> addContact(ContactHiveModel contact) async{
    var box = await Hive.openBox<ContactHiveModel>(HiveTableConstant.contactBox);
    await box.put(contact.contactId, contact);
  }

  Future<List<ContactHiveModel>> getAllContacts() async {
    var box = await Hive.openBox<ContactHiveModel>(HiveTableConstant.contactBox);
    return box.values.toList();
  }
  Future<void> registerStudent(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.id, auth);
  }

  // Login
  Future<bool> loginStudent(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var auths = box.values.toList();
    var auth = auths.firstWhere(
          (element) => element.email == email && element.password == password,
      orElse: () => AuthHiveModel.empty(),
    );

    if (auth == AuthHiveModel.empty()) {
      return false;
    } else {
      return true;
    }
  }


  Future<void> deleteStudent(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  // Delete hive
  Future<void> deleteHive() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    // await Hive.deleteBoxFromDisk(HiveTableConstant.batchBox);
    // await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);

}

}
