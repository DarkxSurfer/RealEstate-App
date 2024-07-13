import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlistapp/Widgets/product.dart';
import 'package:wishlistapp/Widgets/wishlist_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<MyProduct> product = [
    const MyProduct(
        imagePath1: "assets/Images/House.png",
        imagePath2: "assets/Images/Frame3.png",
        heading1: "CRAFTSMAN HOUSE",
        subHeading1: "520 N Btoudry Ave Los Angeles")
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Details",
          style: TextStyle(
              color: Color(0xff0F2F44),
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/Images/Back.png"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/Images/House3.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CRAFTSMAN HOUSE",
                            style: TextStyle(
                                color: Color(0xff0F2F44),
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                          Text(
                            "520 N Beaudry Ave, Los Angeles",
                            style: TextStyle(
                                color: Color(0xff0F2F44),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          // Add or remove item from wishlist
                          provider.toggleWhishList(product[0]);
                        },
                        child: Container(
                          height: 60,
                          width: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAF1FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: FaIcon(
                              size: 25,
                              provider.isInWishlist(product[0])
                                  ? FontAwesomeIcons.solidBookmark
                                  : FontAwesomeIcons.bookmark,
                              color: const Color(0xff0F2F44),
                              
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/Images/Frame3.png"),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: 
                        CircleAvatar(radius: 20,
                          child: Image.asset(
                            'assets/Images/Avatar.png',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meezaab-e-Rehmat",
                              style: TextStyle(
                                  color: Color(0xff0F2F44),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Owner Craftsman House",
                              style: TextStyle(
                                  color: Color(0xff0F2F44),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 30,
                            width: 70,
                            child: Image.asset(
                              "assets/Images/Call.png",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  "Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garage. amazing curb appeal and entertainment area. water views. Tons of built-ins & extras. Read More",
                  style: TextStyle(
                      color: Color(0xff0F2F44),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Gallery",
                  style: TextStyle(
                      color: Color(0xff0F2F44),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Image.asset(
                  "assets/Images/Frame1.png",
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Price",
                  style: TextStyle(
                      color: Color(0xff0F2F44),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                ListTile(
                  title: const Text(
                    "\$5990000",
                    style: TextStyle(
                        color: Color(0xff0F2F44),
                        fontWeight: FontWeight.w800,
                        fontSize: 24),
                  ),
                  trailing: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/Images/Buy.png")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
