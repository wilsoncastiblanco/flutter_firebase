import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String _user;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DevFest"),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _user = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  onSaved: (value) => _password = value,
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: _login,
                )
              ],
            ),
          ),
        )));
  }

  void _login() async {
    final form = _formKey.currentState;

    if (!form.validate()) return;
    form.save();

    try {
        final user = await _auth.signInWithEmailAndPassword(email: _user, password: _password);


        if(user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DevFestApp()));
        }

    } catch (e) {
      //error
    }
  }
}
