import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'temps/Destination.dart';

class DestinationScreen extends StatefulWidget {


  final QueryDocumentSnapshot<Object?> variable;

  const DestinationScreen(
      {Key? key,
      required this.variable})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _DestinationScreenState createState() =>
      // ignore: no_logic_in_create_state
      _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  _DestinationScreenState();
  //create costume stars.
  Text _buildRatingStars(int rating) {
    String stars = '  ';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  /*  void _launchURL() async {
    if (!await launch('https://visitessaouira.net/'))
      throw 'Could not launch link';
  } */

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: widget.variable['imageUrl'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)), //circular(30.0),
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        image: NetworkImage(widget.variable['imageUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.search),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () async {
                              /*  await launch( 'https://visitessaouira.net/', forceSafariVC: false); */
                            },
                          ),
                          /*  if (widget.destination.id < Destinations.length - 1)
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              iconSize: 25.0,
                              color: Colors.black,
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DestinationScreen(
                                    description:
                                        Destinations[widget.destination.id + 1]
                                            .description,
                                    destination:
                                        Destinations[widget.destination.id + 1],
                                  ),
                                ),
                              ),
                            ),
                        */
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.variable['name'],
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          //letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.place,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            widget.variable['label'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                          _buildRatingStars(widget.variable['rating']),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 25.0,
                    ),
                    iconSize: 25.0,
                    color: Colors.black,
                    onPressed:
                        () {}, /* => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UnderMapScreen(
                          currentDestination: widget.destination,
                        ),
                      ),
                    ),
                  ), */ /* Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,*/
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "      " + widget.variable['description'],
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
