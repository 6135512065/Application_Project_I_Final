import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectflutter/screens/loginpage.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  String _email;
  String _password;
  String _tel;
  String _address;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Email..."
                ),
              ),
              TextField(
                onChanged: (value) {
                  _password = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Password..."
                ),
              ),
              TextField(
                onChanged: (value) {
                  _tel = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Telephone Number"
                ),
              ),
              TextField(
                onChanged: (value) {
                  _address = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Address"
                ),
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: _createUser,
                    child: Text("Create New Account"),
                  )
                ],
              )
            ]
        ),

      ),
    );
  }
}
