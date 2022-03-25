import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Destination.dart';

class TopDestination extends StatefulWidget {
  const TopDestination({Key? key}) : super(key: key);

  @override
  _TopDestinationState createState() => _TopDestinationState();
}

class _TopDestinationState extends State<TopDestination> {
  final textController = TextEditingController();


String _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return stars;
  }
 

  @override
  Widget build(BuildContext context) {
    CollectionReference groceries =
        FirebaseFirestore.instance.collection('destination');

int temp = 0;


    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          sindData(temp++);
          /* groceries.add({
            'name': textController.text,
          }); */
          print(
              '***********************************************************************');
          // print(groceriestest.);

          textController.clear();
        },
      ),
      body: Center(
        child: StreamBuilder(
            stream: groceries.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((grocery) {
                  return Center(
                    child: Container(
                      child: GestureDetector(
                        onTap: () {},
                        /* => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                      description: destination.description,
                    ),
                  ),
                ), */
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 210.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: grocery[
                                          'imageUrl'], //NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 180.0,
                                          width: 200.0,
                                          image:
                                              NetworkImage(grocery['imageUrl']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10.0,
                                      bottom: 10.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            grocery['name'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              const Icon(
                                                //Icons.location_searching,
                                                Icons.add,
                                                size: 10.0,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                grocery['label'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 10.0,
                                      top: 10.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          /* Text(
                                    destination.city,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ), */
                                          Text(
                                            //'${destination.activities.length} activities',
                                           _buildRatingStars(grocery['rating']),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          /*  Row(
                                    children: <Widget>[
                                      const Icon(
                                        //Icons.location_searching,
                                        Icons.add,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ), */
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    /* ListTile(
                      title: Text(grocery['name']),
                      onLongPress: () {
                        grocery.reference.delete();
                      },
                    ), */
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
