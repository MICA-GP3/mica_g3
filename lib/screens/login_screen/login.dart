import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'body.dart';

class Login extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => Login());

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  String _usern = '';
  String _pass = '';
  String _errorM = '';

  get usern => _usern;
  set usern(value) => setState(() {
        _usern = value;
      });

  get pass => _pass;
  set pass(value) => setState(() {
        _pass = value;
      });

  get errorM => _errorM;
  set errorM(value) => setState(() {
        _errorM = value;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 20.0, right: 16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 34,
                ),
                Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black38,
                ),
                Center(
                  child: Container(
                    child: Image.asset('images/login_logo.png'),
                  ),
                ),
                FutureBuilder(
                    future: _initializeFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error Initializing DB');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Body(focusNode: _uidFocusNode);
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.amber),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
