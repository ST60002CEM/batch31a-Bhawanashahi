import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfFE9EBEA),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 30),
                child: Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(Icons.search) ,
                      hintText: 'Search Pet and Pet Products..',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                        borderRadius: BorderRadius.circular(10),
                      )


                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
