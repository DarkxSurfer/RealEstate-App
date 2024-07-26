import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wishlistapp/Widgets/signin_func.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  bool passToggle = true;

  final _formfield = GlobalKey<FormState>();

  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffFFFFFF),
          title: const Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff0F2F44),
                fontWeight: FontWeight.w800,
                fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/Images/Logo.png",
                    height: 240,
                    width: 240,
                  ),
                ),
                const Center(
                  child: Text(
                    "Login To Your Account",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0F2F44)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 10),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter valid Email";
                      } else if (!emailValid) {
                        return "Enter valid Email";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            right: 10, left: 10, top: 10, bottom: 10),
                        hintText: 'Password',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      setState(() {});
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (passController.text.length < 6) {
                        return "Password length should be more than 6";
                      }
                    },
                  ),
                ),
                Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      signUp(context, emailController.text, passController.text);
            
                      emailController.clear();
                      passController.clear();
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff0F2F44),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text("SignUp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ));
  }
}
