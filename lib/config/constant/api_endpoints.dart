class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 10000);
  static const Duration receiveTimeout = Duration(seconds: 10000);

  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1OWY3YWNkZTViNTI2NjhhMTE3YTRlMSIsImlhdCI6MTcwNTQ2OTMzOSwiZXhwIjoxNzA4MDYxMzM5fQ.VcvZ37ZSEDLNqufaJxJngW3mflDQvXOiTwCK-qhGsfY';

  // For Windows
  // static const String baseUrl = "http://192.168.56.1:3000/api/";
  static const String baseUrl = "http://10.0.2.2:3000/api/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String create = "user/create";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getAllProduct = "product/get_products";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "user/updateStudent/";
  static const String deleteStudent = "user/deleteStudent/";
  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";

  // ====================== Batch Routes ======================
  static const String sendMessage = "contact/create_contact";
  static const String getAllContact = "contact/get_contact";
  static const String createCart = "cart/create_cart";
  static const String createFavourites = "user/create_favourite";

  // // ====================== Course Routes ======================
  // static const String createCourse = "course/createCourse";
  // static const String deleteCourse = "course/";
  // static const String getAllCourse = "course/getAllCourse";
  //
}
