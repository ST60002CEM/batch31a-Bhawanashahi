
import 'package:flutter/material.dart';
import 'package:online_pet_shop/view/costs.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
                  ),
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.all(size.height*0.030),
            child: Column(
              children: [
                Image.asset( 'assets/images/logo.png'),
               SizedBox(
                 height: size.height*0.024
               ),
                 
                 TextField(
                   keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                    filled: true,
                    hintText: "Email",
                    prefixIcon: IconButton(
                      onPressed: (){},
                        icon: Image.asset(userIcon),
                      
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(37),

                    )
                  ),
                ),
                 SizedBox(
                   height: size.height*0.015,
                 ),
                 TextField(
                   obscureText: true,
                   keyboardType: TextInputType.text,
                   style: const TextStyle(color: Colors.black),
                   decoration: InputDecoration(
                     filled: true,
                     hintText: "Password",
                       prefixIcon: IconButton(
                         onPressed: (){},
                         icon: Image.asset(keyIcon),

                       ),
                     fillColor: Colors.white,
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black),
                       borderRadius: BorderRadius.circular(37),
                     )
                   ),
                 )
                
              ],

            ),
            
          ),
        ),
        
      ),


    );
  }

}
