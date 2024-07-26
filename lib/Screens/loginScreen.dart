import 'package:flutter/material.dart';
import 'package:wishlistapp/Screens/homeScreen.dart';
import 'package:wishlistapp/Screens/signUp_screen.dart';
import 'package:wishlistapp/Widgets/image_button.dart';
import 'package:wishlistapp/Widgets/signin_func.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          backgroundColor: const Color(0xffFFFFFF),
          title: const Text(
            "Login/Sign Up",
            style: TextStyle(
                color: Color(0xff0F2F44),
                fontWeight: FontWeight.w800,
                fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  contentPadding:
                      EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
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
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
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
                    signIn(context, emailController.text, passController.text);

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
                    child: Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot the Password?",
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "━━━━━━━━━━━━━ or continue with ━━━━━━━━━━━━━",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.withOpacity(0.6)),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageButton(imagePath: "assets/Images/Facebook.jpg"),
                SizedBox(
                  width: 25,
                ),
                ImageButton(imagePath: "assets/Images/Google.jpg"),
                SizedBox(
                  width: 25,
                ),
                ImageButton(imagePath: "assets/Images/Apple.jpg"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have an account?",
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    )),
              ],
            ),
          ]),
        )));
  }
}
