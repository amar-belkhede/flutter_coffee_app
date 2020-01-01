import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key key, this.toggleView}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter a valid email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration('Password'),
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 150.0,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        color: Colors.brown[400],
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signinWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'please enter valid credentials or account do not exist.';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color:
                            error.isNotEmpty ? Colors.brown : Colors.brown[100],
                      ),
                      child: Text(
                        error,
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
