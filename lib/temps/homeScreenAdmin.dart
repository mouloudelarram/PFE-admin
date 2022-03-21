import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference groceries =
        FirebaseFirestore.instance.collection('destination');

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        title: TextField(
          controller: textController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'search',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          groceries.add({
            'name': (textController.text != '') ? textController.text : 'Dar Souiri '  ,
          });

          textController.clear();
        },
      ),
      body: Center(
        child: StreamBuilder(
            stream: groceries.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                children: snapshot.data!.docs.map((grocery) {
                  return Center(
                    child:Container(
                    color: Color.fromARGB(179, 148, 238, 230),
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(grocery['name']),
                      onLongPress: () {
                        grocery.reference.delete();
                      },
                    ),
                  ),);
                }).toList(),
              );
            }),
      ),
    );
  }
}
