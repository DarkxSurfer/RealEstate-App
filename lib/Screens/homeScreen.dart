import 'package:flutter/material.dart';
import 'package:wishlistapp/Screens/detailScreen.dart';
import 'package:wishlistapp/Screens/loginScreen.dart';
import 'package:wishlistapp/Screens/wishlistScreen.dart';
import 'package:wishlistapp/Widgets/Filters.dart';
import 'package:wishlistapp/Widgets/imagePlaceHolder.dart';
import 'package:wishlistapp/Widgets/product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late List _pages;

final PageController _pageController = PageController();

final List<MyProduct> imagePaths = [
  MyProduct(
      imagePath1: "assets/Images/House.png",
      imagePath2: "assets/Images/Frame3.png",
      heading1: "CRAFTSMAN HOUSE",
      subHeading1: "520 N Btoudry Ave Los Angeles"),
  const MyProduct(
      imagePath1: "assets/Images/House212.png",
      imagePath2: "assets/Images/Frame3.png",
      heading1: "CRAFTSMAN HOUSE 2",
      subHeading1: "520 N Btoudry Ave Los Angeles"),
  const MyProduct(
      imagePath1: "assets/Images/House3.png",
      imagePath2: "assets/Images/Frame3.png",
      heading1: "CRAFTSMAN HOUSE 3",
      subHeading1: "520 N Btoudry Ave Los Angeles"),
  const MyProduct(
      imagePath1: "assets/Images/House4.jpg",
      imagePath2: "assets/Images/Frame3.png",
      heading1: "CRAFTSMAN HOUSE 4",
      subHeading1: "520 N Btoudry Ave Los Angeles"),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(
      imagePaths.length,
      (index) => imagePaths[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const ListTile(
              title: Text('Login',
                  style: TextStyle(
                      color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const ListTile(
              title: Text('Home',
                  style: TextStyle(
                      color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()));
            },
            child: const ListTile(
              title: Text(
                'WishList',
                style: TextStyle(
                    color: Color(0xff0F2F44), fontWeight: FontWeight.w700),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen()));
            },
            child: const ListTile(
              title: Text('Details',
                  style: TextStyle(
                      color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      )),
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Home Screen",
          style: TextStyle(
              color: Color(0xff0F2F44),
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Image.asset('assets/Images/Bookmark.png'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Location",
                style: TextStyle(
                    color: const Color(0xff0F2F44).withOpacity(1),
                    fontSize: 10),
              ),
              const Text("Los Angeles,CA",
                  style: TextStyle(
                      color: Color(0xff0F2F44),
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              const SizedBox(
                height: 10,
              ),
              const Text("Discover Best \nSuitable Property",
                  style: TextStyle(
                      color: Color(0xff0F2F44),
                      fontWeight: FontWeight.w800,
                      fontSize: 24)),
              Filters(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Best for you",
                style: TextStyle(
                    color: Color(0xff0E3146),
                    fontSize: 16,
                    fontWeight: FontWeight.w100),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 470,
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        itemCount: _pages.length,
                        itemBuilder: (context, index) {
                          return _pages[index];
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Nearby your location ",
                style: TextStyle(
                    color: Color(0xff0E3146),
                    fontSize: 16,
                    fontWeight: FontWeight.w100),
              ),
              Image.asset("assets/Images/Frame2.png"),
              
            ],
          ),
        ),
      ),
    );
  }
}
