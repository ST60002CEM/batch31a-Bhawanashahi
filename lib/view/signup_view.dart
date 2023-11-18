import 'package:flutter/material.dart';
import 'package:online_pet_shop/view/login_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  Widget _buildFullNameTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Full Name",
              hintStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Icon(
            Icons.email,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ))),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.lock_outline_sharp,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            obscureText: _isObscurePassword,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  )),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscurePassword = !_isObscurePassword;
                  });
                },
                child: Icon(
                  _isObscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.lock,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            obscureText: _isObscureConfirmPassword,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Confirm Password",
              hintStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscureConfirmPassword = !_isObscureConfirmPassword;
                  });
                },
                child: Icon(
                  _isObscureConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSignUpBin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33.0),
        ),
        color: Color.fromRGBO(216, 129, 47, 20),
        padding: EdgeInsets.symmetric(vertical: 18.0),
        onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>LoginPage()),)
        },
        child: Text(
          "SIGN UP",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

  }

  Widget _buildExistingUserTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Go to",
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () => {
          },
          child: Text(
            "SignIn",
            style: TextStyle(
                fontSize: 16.5,
                color: Color.fromRGBO(216, 129, 47, 20),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 600,
                    height: 400,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFullNameTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildEmailTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildConfirmPasswordTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildSignUpBin(),
                    _buildExistingUserTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}