import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Services/authController.dart';
import '../screens/modifyDestination.dart';

class ShowDestination extends StatefulWidget {
  const ShowDestination({Key? key}) : super(key: key);

  @override
  _ShowDestinationState createState() => _ShowDestinationState();
}

class _ShowDestinationState extends State<ShowDestination> {
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

  
    CollectionReference? destination =
       FirebaseFirestore.instance.collection('destination');

  Stream<QuerySnapshot<Object?>>? test  ;
    int temp = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3EBACE),
        title: Text('Destinations list'),
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
      body: Center(
        child: StreamBuilder(
            stream: destination.orderBy('id').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data!.docs.map((destination) {
                  return Center(
                    child: Container(

                    child: GestureDetector(
                      onTap: ()
                        => Navigator.push(
                            context,
                            MaterialPageRoute(
                              //ici ou on instancie la classe ModifyDestination
                              builder: (_) => ModifyDestination(
                                element : destination,
                              ),
                            ),
                          ),


                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: w*0.9,
                          
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
                                      tag: destination[
                                          'imageUrl'], //NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image(
                                           height: (defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows) ? h*0.85 : w*0.9,
                         
                                          width: w*0.9,
                                          image:
                                              NetworkImage(destination['imageUrl']),
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
                                            destination['name'],
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
                                                destination['label']+" @"+destination['id'].toString(),
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
                                            _buildRatingStars(
                                                destination['rating']),
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
                      title: Text(destination['name']),
                      onLongPress: () {
                        destination.reference.delete();
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
