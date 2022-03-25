import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the generated file
import 'Services/authController.dart';
import 'auth/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFFD8ECF1)),
      ),
      home: Login(), // ici où on spécifier le contenue de notre app
    );
  }
}










































































































































































































































































































































/* import 'package:flutter/material.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Sign up', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            onPressed: null,
            child: const Text('Sign up'),
          ),
          Container(
            height: 800,
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
            child: const TextField(
              obscureText: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
        ],
      ),
    );
  }
} */













/* /* //import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Essaouira Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
  Future createUser({required String name}) async {
    final docUser =
        FirebaseFirestore.instance.collection('destination')!.doc();
    final json = {
      'id': 1,
      'imageUrl': 'assets/images/latourdehorloge.jpg',
      'city': 'Essaouira',
      'country': 'Maroc',
      'description': name,
      'label': 'Ville juive et commerciale',
      'type': '',
      'name': 'La Tour de l\'Horloge',
      'address': 'Essaouira',
      'rating': 0,
      'markerId': 'id-2',
      'latitude': 31.512142010542288,
      'longitude': -9.770698661868849,
      'icon': '',
      'title': 'La Tour de l\'Horloge ',
      'snippet': 'Un lieu historique',
      'category': 'normale',
    };
//create document 
    await docUser.set(json);
  }

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
        actions: [
          IconButton(
            onPressed: () {
              final name = controller.text;
              createUser(name: name);
            },
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
    );

    
  }
}
 */

// root App.
/* 
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference groceries =
        FirebaseFirestore.instance.collection('destination');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            groceries.add({
              'name': textController.text,
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
                      child: ListTile(
                        title: Text(grocery['name']),
                        onLongPress: () {
                          grocery.reference.delete();
                        },
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
 */
*/





















































































/* 
class Storage extends StatefulWidget {
  const Storage({Key? key}) : super(key: key);

  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  final textController = TextEditingController();
  String ImagePath = 'nofile.png';

  void change() {
    setState(() {
      ImagePath = ImagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    StorageM storage = StorageM();

    storage.listFiles();
    CollectionReference groceries =
        FirebaseFirestore.instance.collection('destination');

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          groceries.add({
            'name': textController.text,
          });

          textController.clear();
        },
      ), */
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
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

                  storage.uploadFile(path!, fileName);
                  print(
                      '*************************************************************************************************');
                  print(path);
                  ImagePath = fileName;
                  change();
                  print(fileName);
                }
                ;
              },
              child: Text('Upload File'),
            ),
          ),
          FutureBuilder(
              future: storage.downloadURL(ImagePath),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: 200,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),
          FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context,
                  AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(snapshot.data!.items[index].name),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),
          FutureBuilder(
              future: storage.downloadURL('sqaladuport.jpg'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),
        ],
      ),
    );
  }
}

class Cloud extends StatefulWidget {
  const Cloud({Key? key}) : super(key: key);

  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference groceries =
        FirebaseFirestore.instance.collection('destination');

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          groceries.add({
            'name': textController.text,
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
                    child: ListTile(
                      title: Text(grocery['name']),
                      onLongPress: () {
                        grocery.reference.delete();
                      },
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
  */