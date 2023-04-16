import 'package:flutter/material.dart';
import 'package:pilleripeli/heart.dart';
import 'package:pilleripeli/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class gamemenu extends StatefulWidget {
  gamemenu({Key? key}) : super(key: key);

  @override
  State<gamemenu> createState() => _gamemenuState();
}

class _gamemenuState extends State<gamemenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 221, 248),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
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
                      Text(
                        "Peli\n Game Menu",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 80,
                        height: 30,
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.heart_broken),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          backgroundColor: Color.fromARGB(255, 237, 11, 196),
                        ),
                        label: Text('Heart medecine'),
                        onPressed: () async {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => heartMenu(),
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
                        icon: Icon(Icons.medical_services_outlined),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Color.fromARGB(255, 33, 1, 30),
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          backgroundColor: Color.fromARGB(255, 237, 11, 196),
                        ),
                        label: Text('Lungs medecine'),
                        onPressed: () async {
                          {}
                        },
                      ),
                      SizedBox(
                        width: 80,
                        height: 30,
                      ),
                      SizedBox(
                        width: 80,
                        height: 100,
                      ),
                    ],
                  )),
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
