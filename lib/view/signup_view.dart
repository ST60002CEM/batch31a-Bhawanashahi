import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Widget _buildEmailTextField(){
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
            width:10.0 ,
          ),
          Expanded(
              child:TextField(
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                decoration:
                InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )
                    )

                ),
              )



          )
        ],
      );
    }
    Widget _buildPasswordTextField(){
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
              child:TextField(
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
                        )
                    )
                ),
              ))
        ],
      );
    }
    Widget _buildLoginBin(){
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          elevation:0.0 ,
          highlightElevation: 0.0,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33.0),
          ) ,
          color: Color.fromRGBO(216, 129, 47, 20),
          padding: EdgeInsets.symmetric(vertical: 18.0),
          onPressed: ()=>{},
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontSize:30.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height ,
          margin: EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/logo.png",
                    width: 1000,
                    height: 500,),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildEmailTextField(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Text("Forget Password?", style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    _buildLoginBin(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
