import 'package:admin/Services/StorageService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PushData extends StatefulWidget {
  const PushData({Key? key}) : super(key: key);

  @override
  _PushDataState createState() => _PushDataState();
}

class _PushDataState extends State<PushData> {
  var idController = TextEditingController();
  var imageUrlController = TextEditingController().text = 'nofile.png';
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

  List<bool> _selections = List.generate(2, (_) => false);

  void change() {
    setState(() {
      imageUrlController = imageUrlController;
    });
  }

  StorageM storage = StorageM();

  Future addDestination() async {
    final docDestination =
        FirebaseFirestore.instance.collection('destination').doc();
    final json = {
      'id': idController.text,
      'imageUrl': await storage.downloadURL(imageUrlController),
      'city': cityController.text,
      'country': countryController.text,
      'description': descriptionController.text,
      'label': labelController.text,
      'type': typeController.text,
      'name': nameController.text,
      'address': addressController.text,
      'rating': ratingController.text,
      'markerId': 'id-${idController.text}',
      'latitude': latitudeController.text,
      'longitude': longitudeController.text,
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

    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Ajoute une autre destination.'),
      )),
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
                          fontWeight: FontWeight.w700,
                          color: Colors.cyan),
                    ),
                  ),
                  //id field
                  Container(
                    child: TextField(
                      controller: idController,
                      onChanged: (n) {
                        print(n.toString());
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'destination id',
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
                  Container(
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

                  //country flied
                  Container(
                    child: TextField(
                      controller: countryController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'country',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

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
                      /* borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],*/
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
                      keyboardType: TextInputType.multiline,
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
                              setState(() {
                                typeController.text = value.toString();
                              });
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
                              setState(() {
                                typeController.text = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Upload Image .
                  Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                      'Upload Image.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
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
                                /* print(
                                    '//////////////////////////////////////////////////');
                                print(snapshot.data); */
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
                                return CircularProgressIndicator();
                              }
                              return Container();
                            },
                          ),
                          /*  FutureBuilder(
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
                                    child: Text(imageUrlController),
                                  );
                                }
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }
                                return Container();
                              },
                            ), */
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
                                final path = results.files.single.path;
                                final fileName = results.files.single.name;

                                storage.uploadFile(path.toString(), fileName);
                                print(
                                    '*************************************************************************************************');
                                print(path);
                                imageUrlController = fileName;
                                //change();
                                print(fileName);
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
                          fontWeight: FontWeight.w700,
                          color: Colors.cyan),
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
                              setState(() {
                                categoryController.text = value.toString();
                              });
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
                              setState(() {
                                categoryController.text = value.toString();
                              });
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
                addDestination();
                print('done!!');
              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: w * 0.9,
                height: h * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.cyan,
                ),
                child: Center(
                  child: Text(
                    "Add destination",
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
            /*ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
        ), */
          ],
        ),
      ),
    );
  }
}

//trache
/*  child: Center(
                      child: ToggleButtons(
                        borderColor: Colors.white,

                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            //width: 100,
                            child: Row(children: [
                              Icon(Icons.circle),
                              Text(' Historical'),
                            ]),
                          ),
                          Container(
                            //width: 30,
                            margin: EdgeInsets.all(20),
                            child: Row(children: [
                              Icon(Icons.circle),
                              Text(' Other'),
                            ]),
                          ),
                        ],
                        isSelected: _selections,
                        onPressed: (int index) {
                          setState(() {
                            (index == 1)
                                ? _selections[0] = false
                                : _selections[1] = false;
                            _selections[index] = !_selections[index];
                          });
                        },
                        color: Color.fromARGB(179, 75, 69, 69),
                        selectedColor: Colors.cyan,
                        selectedBorderColor: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        //fillColor: Colors.yellow,
                      ),
                    ),
                  */
