import 'package:flutter/material.dart';
import 'package:wishlistapp/Screens/detailScreen.dart';

class Product {
  final String id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

class MyProduct extends StatelessWidget {
  const MyProduct({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
    required this.heading1,
    required this.subHeading1,
  });

  final String imagePath1;
  final String imagePath2;
  final String heading1;
  final String subHeading1;

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10
      ),
      child: InkWell(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen()));
                  },
        child: Column(
          children: [
            Container(
              
              decoration: BoxDecoration(color: Color(0xff0E3146),
              borderRadius: BorderRadius.circular(20)
              ),
              height: 299,
              width: 305,
              child: Column(
                children: [
                  Image.asset(imagePath1),
                  SizedBox(
                    width: 305,
                    height: 87,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            heading1,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(subHeading1,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.5))),
                          Image.asset(imagePath2),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
