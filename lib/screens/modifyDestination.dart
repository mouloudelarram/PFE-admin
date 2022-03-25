import 'package:flutter/foundation.dart';
import 'dart:typed_data';
import 'package:admin/Services/StorageService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../Services/authController.dart';

class ModifyDestination extends StatefulWidget {
  //String emailAdmin;
  QueryDocumentSnapshot<Object?> element;
  ModifyDestination({Key? key, required this.element}) : super(key: key);

  @override
  _ModifyDestinationState createState() =>
      _ModifyDestinationState(element: this.element);
}

class _ModifyDestinationState extends State<ModifyDestination> {
  //String emailAdmin;
  QueryDocumentSnapshot<Object?> element;
  _ModifyDestinationState({required this.element});
  var idController = TextEditingController();
  var imageUrlController =
      TextEditingController().text = ''; //.text = 'nofile.png';
  var cityController = TextEditingController();
  var countryController = TextEditingController();
  var descriptionController = TextEditingController();
  var labelController = TextEditingController();
  var ratingController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var typeController = TextEditingController();
  var markerIdController = TextEditingController();
  var latitudeController = TextEditingController();
  var longitudeController = TextEditingController();
  var iconController = TextEditingController();
  var titleController = TextEditingController();
  var snippetController = TextEditingController();
  var categoryController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cityController.dispose();
    idController.dispose();
    //imageUrlController.dispose('nofile.png');
    cityController.dispose();
    countryController.dispose();
    descriptionController.dispose();
    labelController.dispose();
    ratingController.dispose();
    nameController.dispose();
    addressController.dispose();
    typeController.dispose();
    markerIdController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    iconController.dispose();
    titleController.dispose();
    snippetController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void initialize() {
    idController.text = element['id'].toString();
    //imageUrlController = element['imageUrl'].toString();
    cityController.text = element['city'];
    countryController.text = element['country'];
    descriptionController.text = element['description'];
    labelController.text = element['label'];
    ratingController.text = element['rating'].toString();
    nameController.text = element['name'];
    addressController.text = element['address'];
    typeController.text = element['type'];
    markerIdController.text = element['markerId'];
    latitudeController.text = element['latitude'].toString();
    longitudeController.text = element['longitude'].toString();
    iconController.text = element['icon'];
    titleController.text = element['title'];
    snippetController.text = element['snippet'];
    categoryController.text = element['category'];
  }

  List<bool> _selections = List.generate(2, (_) => false);

  void change() {
    setState(() {
      imageUrlController = imageUrlController;
      typeController.text = element['type'];
      categoryController.text = element['category'];
    });
  }

  StorageM storage = StorageM();

  Future modifyDestination() async {
    await FirebaseFirestore.instance
        .collection('destination')
        .orderBy('id')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc.get('id') == element['id'] &&
            doc.get('name') == element['name']) {
          doc.reference.delete();
        }
      });
    });

    final docDestination =
        await FirebaseFirestore.instance.collection('destination').doc();
    final json = {
      'id': int.parse(idController.text),
      'imageUrl': (imageUrlController != '')
          ? await storage.downloadURL(imageUrlController)
          : element['imageUrl'].toString(),
      'city': 'Essaouira', //cityController.text,
      'country': 'Maroc', //countryController.text,
      'description': descriptionController.text,
      'label': labelController.text,
      'type': typeController.text,
      'name': nameController.text,
      'address': addressController.text,
      'rating': int.parse(ratingController.text),
      'markerId': 'id-${nameController.text}', //'id-${idController.text}',
      'latitude': double.parse(latitudeController.text),
      'longitude': double.parse(longitudeController.text),
      'icon': '',
      'title': titleController.text,
      'snippet': snippetController.text,
      'category': categoryController.text,
    };
//create document
    await docDestination.set(json);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    initialize();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3EBACE),
        title: Text(element['name']),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Destination Information.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF3EBACE),
                      ),
                    ),
                  ),
                  //id field
                  Container(
                    child: TextField(
                      controller: idController,
                      /* onChanged: (n) {
                        print(n.toString());
                      }, */
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'destination number',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //name field
                  Container(
                    child: TextField(
                      controller: nameController,
                      onChanged: (n) {
                        print(n.toString());
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //city field
                  /* Container(
                    child: TextField(
                      controller: cityController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'city',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
 */

                  //country flied
                  /* Container(
                    child: TextField(
                      controller: countryController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'country',
                      ),
                    ),
                  ), */
                  /* const SizedBox(
                    height: 20,
                  ), */

                  //label field
                  Container(
                    child: TextField(
                      controller: labelController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'label',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //description field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'description',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //address field
                  Container(
                    child: TextField(
                      controller: addressController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'address',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //rating field
                  Container(
                    child: TextField(
                      controller: ratingController,
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'rating',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //type field
                  Container(
                    child: TextField(
                      controller: typeController,
                      //keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'type',
                      ),
                    ),
                  ),

                  Container(
                    width: w * 0.5,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          selectedTileColor: Colors.cyan,
                          selectedColor: Colors.cyan,
                          title: const Text('Historical'),
                          leading: Radio(
                            value: 'Historical',
                            groupValue: typeController,
                            onChanged: (value) {
                              typeController.text = value.toString();
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Other'),
                          selectedTileColor: Colors.cyan,
                          selectedColor: Colors.cyan,
                          leading: Radio(
                            value: 'Other',
                            groupValue: typeController,
                            onChanged: (value) {
                              typeController.text = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Upload Image .
                  Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: const Text(
                      'Upload Image.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF3EBACE),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: w,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          FutureBuilder(
                            future: storage.downloadURL(imageUrlController),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return Container(
                                  width: 100,
                                  height: 50,
                                  margin: EdgeInsets.all(20),
                                  child: Image.network(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return Container(
                                  width: 100,
                                  height: 50,
                                  margin: EdgeInsets.all(20),
                                  child: Image.network(
                                    element['imageUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ); //CircularProgressIndicator();
                              }
                              return Container();
                            },
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final results =
                                  await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg'],
                              );

                              if (results == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No file selected.'),
                                  ),
                                );
                              } else {
                                if (defaultTargetPlatform ==
                                        TargetPlatform.iOS ||
                                    defaultTargetPlatform ==
                                        TargetPlatform.android) {
                                  print(
                                      '********************************************');
                                  final path = results.files.single.path;
                                  final fileName = results.files.single.name;
                                  storage.uploadFile(path.toString(), fileName);
                                  print(path);
                                  imageUrlController = fileName;
                                  change();
                                  print(fileName);
                                } else {
                                  final fileName = results.files.single.name;
                                  Uint8List? uploadfile =
                                      results.files.single.bytes;
                                  storage.uploadFileBytes(
                                      uploadfile!, fileName);
                                  print(uploadfile);
                                  imageUrlController = fileName;
                                  change();
                                  print(fileName);
                                }
                              }
                              ;
                            },
                            child: Text('Upload File'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Carte Information.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF3EBACE),
                      ),
                    ),
                  ),
                  //latitude field
                  Container(
                    child: TextField(
                      controller: latitudeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'latitude',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //longitude field
                  Container(
                    child: TextField(
                      controller: longitudeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'longitude',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //title field
                  Container(
                    child: TextField(
                      controller: titleController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'title',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //snippet field
                  Container(
                    child: TextField(
                      controller: snippetController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'snippet',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //category field
                  Container(
                    child: TextField(
                      controller: categoryController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'category',
                      ),
                    ),
                  ),
                  Container(
                    width: w * 0.5,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          selectedTileColor: Colors.cyan,
                          selectedColor: Colors.cyan,
                          title: const Text('normal'),
                          leading: Radio(
                            value: 'normal',
                            groupValue: categoryController,
                            onChanged: (value) {
                              categoryController.text = value.toString();
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('special '),
                          selectedTileColor: Colors.cyan,
                          selectedColor: Colors.cyan,
                          leading: Radio(
                            value: 'special ',
                            groupValue: typeController,
                            onChanged: (value) {
                              categoryController.text = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            TextButton(
              onPressed: () {
                modifyDestination();

                print('done!!');
              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: w * 0.9,
                height: h * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF3EBACE),
                ),
                child: Center(
                  child: Text(
                    "Modify information",
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
              height: h * 0.2,
            ),
            SizedBox(
              height: h * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}







/**
 * import 'package:flutter/foundation.dart';
if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
    // Some android/ios specific code
}
else if (defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows) {
    // Some desktop specific code there
}
else {
    // Some web specific code there
}
 */