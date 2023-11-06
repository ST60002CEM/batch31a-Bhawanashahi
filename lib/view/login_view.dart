import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png', // Replace with your logo image asset path
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Implement your "Forgot Password" logic here
                  },
                  child: Text('Forgot Password'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement your login logic here
                    String email = emailController.text;
                    String password = passwordController.text;
                    print('Email: $email, Password: $password');
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Implement your "Sign Up" logic here
                      },
                      child: Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon),
      ),
      obscureText: obscureText,
    );
  }
}
