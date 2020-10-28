import 'package:flutter/material.dart';

//import 'package:news_app/api/authentication_api.dart';
// ignore: unused_import
import 'package:news_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool loginError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGIN'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: (isLoading) ? _drawLoading() : _drawLoginForm(),
      ),
    );
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login Error'),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    loginError = false;
                  });
                },
                child: Text(
                  'try Again',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Username"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your username';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Password"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(
              height: 48,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(onPressed: () {
                   if ( _formKey.currentState.validate()) {
                     // ignore: todo
                     // TODO : Call Api for login
                     setState(() {
                       isLoading = true;
                     });
                   }
                },
                child: Text('LOGIN',style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _drawLoading() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
