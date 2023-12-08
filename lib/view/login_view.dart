import 'package:flutter/material.dart';
import 'package:online_pet_shop/view/homepage_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscurePassword = true;

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

  Widget _buildLoginBin() {
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
            MaterialPageRoute(builder: (context)=>Homepage()),)
        },
        child: Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat Bold'
          ),
        ),
      ),
    );
  }

  Widget _buildNewuserTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
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
          onTap: () => {},
          child: Text(
            "SignUp",
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
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmailTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    _buildLoginBin(),
                    _buildNewuserTextField(),
                    SizedBox(
                      height: 35.0,
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