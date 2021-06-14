import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hasta_rental/screens/signup_screen/signup_vm.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  final FocusNode _usernameNode = FocusNode();
  final FocusNode _fullnameNode = FocusNode();
  final FocusNode _ic = FocusNode();
  final FocusNode _matricNoNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _usernameNode.unfocus();
        _fullnameNode.unfocus();
        _ic.unfocus();
        _matricNoNode.unfocus();
        _phoneNode.unfocus();
        _emailNode.unfocus();
        _passwordNode.unfocus();
      },
      child: Scaffold(
        //appBar: AppBar(),
        body: SafeArea(
            child: Expanded(
                child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error Initialize FIrebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return SignUpVM(
                        usernameNode: _usernameNode,
                        fullnameNode: _fullnameNode,
                        ic: _ic,
                        matricNoNode: _matricNoNode,
                        phoneNode: _phoneNode,
                        emailNode: _emailNode,
                        passwordNode: _passwordNode,
                      );
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    );
                  },
                )),
          ],
        ))),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[DrawerHeader(child: Text('Header'))],
          ),
        ),
      ),
    );
  }
}
