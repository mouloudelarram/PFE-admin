import 'package:flutter/material.dart';

import '../../Services/authController.dart';


class Home extends StatelessWidget {
  String? email = "email@email.com";
  Home({Key? key, required this.email}) : super(key: key);

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
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/test1.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
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
                    backgroundImage: AssetImage("img/profil.png"),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  //"email@email.com",
                  "${email}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.2,
          ),
          GestureDetector(
              onTap: () {
                AuthController.instance.logOut();
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
                    "Log Out",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
