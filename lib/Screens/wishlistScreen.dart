import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlistapp/Screens/detailScreen.dart';
import 'package:wishlistapp/Screens/homeScreen.dart';
import 'package:wishlistapp/Screens/loginScreen.dart';
import 'package:wishlistapp/Widgets/product.dart';
import 'package:wishlistapp/Widgets/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

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
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "Wishlist",
          style: TextStyle(
              color: Color(0xff0F2F44),
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
        automaticallyImplyLeading: true,
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
      body: wishlistProvider.wishlist.isEmpty
          ? const Center(
              child: Text(
                'No items in wishlist',
                style: TextStyle(
                  color: Color(0xff0F2F44),
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              itemCount: wishlistProvider.wishlist.length,
              itemBuilder: (context, index) {
                MyProduct product = wishlistProvider.wishlist[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Image.asset(
                        product.imagePath1,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        product.heading1,
                        style: const TextStyle(
                          color: Color(0xff0F2F44),
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        product.subHeading1,
                        style: const TextStyle(
                          color: Color(0xff0F2F44),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xff0F2F44),
                        ),
                        onPressed: () {
                          wishlistProvider.toggleWhishList(product);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}


