import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wishlistapp/Screens/homeScreen.dart';
import 'package:wishlistapp/Screens/loginScreen.dart';
import 'package:wishlistapp/Widgets/wishlist_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: 
    MyApp(),
  ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
