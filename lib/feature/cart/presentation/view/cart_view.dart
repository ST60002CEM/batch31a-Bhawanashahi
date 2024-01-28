import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  List imagesList=[
    "assets/images/Husky.jfif",
    "assets/images/rot.jfif",
    "assets/pig.jfif",
    "assets/white rabbit.png",
    "assets/cat.jfif",
  ];
  List productTitles=[
    "Husky",
    "Rot Whiller",
    "pig",
    "Rabbit",
    "cat"

  ];

  List Prices=[
    "/ Rs 200",
    "/ Rs 380",
    "/ Rs 120",
    "/ Rs 80"
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading:  BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: imagesList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              splashRadius:20,
                              activeColor: Color(0xD8812F),
                              value: true, onChanged: (val){},
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    imagesList[index],
                                height: 90,),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productTitles[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text("Pet Bed",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),),
                                SizedBox(height: 10),
                                  Text(
                                    Prices[index],
                                    style: TextStyle(
                                      color: Color(0xD8812F),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),

                                  )

                              ],
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.minus,
                                color: Colors.green,),
                                SizedBox(width: 20),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(CupertinoIcons.plus,
                                color: Color(0xD8812F),)
                              ],
                            )
                          ],
                        ),
                      );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
