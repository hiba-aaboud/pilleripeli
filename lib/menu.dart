import 'package:flutter/material.dart';
import 'package:pilleripeli/gamemenu.dart';
import 'package:pilleripeli/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class menu extends StatefulWidget {
  menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 221, 248),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(
                size: 28,
                Icons.logout,
                color: Color.fromARGB(255, 237, 11, 196),
              ),
            )
          ]),
        ),
        body: Container(
            width: 550,
            height: 1000.0,
            child: Stack(alignment: Alignment.center, children: [
              SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Text(
                                  "Pilleripeli",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 50,
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.quiz),
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    padding: const EdgeInsets.fromLTRB(
                                        125, 20, 125, 20),
                                    backgroundColor:
                                        Color.fromARGB(255, 237, 11, 196),
                                  ),
                                  label: Text('Peli/Game'),
                                  onPressed: () async {
                                    {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => gamemenu(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 30,
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.book),
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    backgroundColor:
                                        Color.fromARGB(255, 237, 11, 196),
                                  ),
                                  label:
                                      Text('Opiskelumateriaali/Study material'),
                                  onPressed: () async {
                                    {}
                                  },
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 30,
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.wifi_protected_setup),
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.white,
                                    padding: const EdgeInsets.fromLTRB(
                                        37, 20, 37, 20),
                                    backgroundColor:
                                        Color.fromARGB(255, 237, 11, 196),
                                  ),
                                  label:
                                      Text('Tietosuoja/muu / data protected'),
                                  onPressed: () async {
                                    {}
                                  },
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 100,
                                ),
                              ],
                            )),
                      ]))
            ])));
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
