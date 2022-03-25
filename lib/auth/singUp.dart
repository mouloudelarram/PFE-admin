import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/authController.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<String> images = [
      "g.png",
      "t.png",
      "f.png",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: w,
              height: h * 0.3,
              child: Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("img/logo3.png"),
                      backgroundColor: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.deepOrangeAccent,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            //inputs
            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
                print("Hi");
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(
                      "img/loginbtn.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Sing up",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.06,
            ),
            SizedBox(
              height: h * 0.07,
            ),
            RichText(
              text: TextSpan(
                text: "Or Sing up with these methods, ",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("img/" + images[index]),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
