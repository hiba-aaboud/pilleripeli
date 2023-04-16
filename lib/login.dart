import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'addcategory.dart';
import 'menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool cacher = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 221, 248),
        body: Container(
          width: 700.0,
          height: 1100.0,
          padding: const EdgeInsets.all(20),
          child: Stack(alignment: Alignment.center, children: [
            SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 200,
                    ),

                    // Login text Widget
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                            // textAlign: TextAlign.center,
                          ),

                          SizedBox(
                            height: 60,
                            width: 10,
                          ),

                          // Wrong Password text

                          TextFormField(
                            controller: usernameController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              hintText: 'Username',
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          TextFormField(
                            obscureText: cacher,
                            controller:
                                passwordController, // Controller for Password
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(cacher
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      cacher = !cacher;
                                    });
                                  }),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.password),
                              contentPadding: const EdgeInsets.all(20),
                              // Adding the visibility icon to toggle visibility of the password field
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Submit Button
                    ElevatedButton.icon(
                      icon: Icon(Icons.login),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          backgroundColor: Color.fromARGB(255, 237, 11, 196),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      label: Text('Login'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          signIn(
                              usernameController.text, passwordController.text);
                        }
                      },
                    ),
                  ],
                ))
          ]),
        ));
  }

  void signIn(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => categoryAdd(),
      ),
    );
  }
}
