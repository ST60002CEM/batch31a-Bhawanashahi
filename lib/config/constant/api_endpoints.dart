class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1OWY3YWNkZTViNTI2NjhhMTE3YTRlMSIsImlhdCI6MTcwNTQ2OTMzOSwiZXhwIjoxNzA4MDYxMzM5fQ.VcvZ37ZSEDLNqufaJxJngW3mflDQvXOiTwCK-qhGsfY';

  // For Windows
  // static const String baseUrl = "http://192.168.82.154:3000/api/v1/";
  static const String baseUrl = "http://10.0.2.2:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String getAllStudent = "auth/getAllStudents";
  // static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";

  // ====================== Batch Routes ======================
  static const String createContact = "contact/createContact";
  static const String getAllContact = "contact/getAllContacts";

  // // ====================== Course Routes ======================
  // static const String createCourse = "course/createCourse";
  // static const String deleteCourse = "course/";
  // static const String getAllCourse = "course/getAllCourse";
  //

}
