import 'package:flutter/material.dart';
import 'package:pilleripeli/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class heartMenu extends StatefulWidget {
  heartMenu({Key? key}) : super(key: key);

  @override
  State<heartMenu> createState() => _heartMenuState();
}

class _heartMenuState extends State<heartMenu> {
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
        body: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Akuutin sydäntapahtuman lääkkeet",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Isosorbididinitraatti'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Glyseryylitrinitraatti'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Asetyylisalisyylihappo'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Enoksapariini'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Klopidogreeli'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Prasugreeli'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Tikagrelori'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Tenekteplaasi'),
                  onPressed: () async {
                    {}
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.medical_services_outlined),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromARGB(255, 33, 1, 30),
                    backgroundColor: Color.fromARGB(255, 237, 11, 196),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  label: Text('Furosemidi'),
                  onPressed: () async {
                    {}
                  },
                )),
          ],
        ));
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
