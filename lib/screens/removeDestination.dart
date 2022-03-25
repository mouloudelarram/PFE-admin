import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Services/authController.dart';

class RemoveDestination extends StatefulWidget {
  const RemoveDestination({Key? key}) : super(key: key);

  @override
  _RemoveDestinationState createState() => _RemoveDestinationState();
}

class _RemoveDestinationState extends State<RemoveDestination> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference? destination =
        FirebaseFirestore.instance.collection('destination');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3EBACE),
        title: Text('Remove destinations'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              AuthController.instance.logOut();
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
            stream: destination.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                children: snapshot.data!.docs.map((grocery) {
                  return Center(
                    child: ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color.fromARGB(255, 244, 255, 255),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              grocery['name'],
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 196, 92, 85),
                                ),
                                onPressed: () {
                                  grocery.reference.delete();
                                }),
                          ],
                        ),
                      ),
                      /* onLongPress: () {
                        grocery.reference.delete();
                      }, */
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
