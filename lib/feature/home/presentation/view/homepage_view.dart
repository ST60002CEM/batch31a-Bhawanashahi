import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(Icons.home_filled),
                Text("Home"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.category_rounded),
                Text("Category"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.add_shopping_cart),
                Text("Cart"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.notification_add_rounded),
                Text("Notifications"),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xfFE9EBEA),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 18, right: 10),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 320,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Pet and Pet Products..',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffD8812F),),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Image(
                  height: 50,
                  width: 40,
                  image: AssetImage('assets/images/pp.png'),
                ),
                SizedBox(
                  width:10,
                ),
              ],
            ),
          ),
          Image(
              image: AssetImage(
                  'assets/images/banner.png'
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: 130,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 280),
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: 130,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("NEW ARRIVAL",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18),
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Image(
                          height:200,
                          width: 200,
                          image: AssetImage(
                              'assets/images/rot.jfif')),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 180, ),
            child: Text("ROTTWILLER FEMALE",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 180, ),
            child: Text("RS 38000",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: SizedBox(
              // width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                elevation: 0.0,
                highlightElevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color.fromRGBO(216, 129, 47, 20),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
                onPressed: () => {},
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}