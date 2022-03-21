import 'package:flutter/gestures.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'authController.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

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
              /* decoration: const BoxDecoration(
                /* image: DecorationImage(
                  image: AssetImage(
                    "img/test1.png",
                  ),
                  fit: BoxFit.cover,
                ),
               */), */
              child: Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  //SizedBox(height: h*0.18,),
                  Container(
                    /* decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan, width: 5),
                    borderRadius: BorderRadius.circular(50),
                  ), */
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
                  image: const DecorationImage(
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
            /* ElevatedButton(
              child: const Text('Open route'),
              // ignore: prefer_const_constructors
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  backgroundColor: Colors.transparent,
                ),
                primary: Colors.white, // background
                onPrimary: Colors.blue, // foreground
              ),

              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ), */
          ],
        ),
      ),
    );
  }
}
