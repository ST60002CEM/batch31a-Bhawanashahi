import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          //logo
          Icon(
              Icons.lock,
            size: 100,
          )
          //username textfield
          //password textfield
          //forgetpassword
          //signin button
          //register

        ],
      ),
      
    );
  }
}

