import 'package:flutter/material.dart';
import 'main.dart';

//void main() => runApp(new MyApp());
/*
  This file is is the reset password screen for the HouseHawk mobile application.
  It includes text fields for username, password and old password.
  It includes a button to reset password.
 */
class ResetPassword extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        //title: 'Login page',
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Rest Password'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Back to home screen',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
            body: new Container(
                child: new ListView(
              children: <Widget>[
                new Center(
                  child: new TextFormField(
                    decoration: new InputDecoration(labelText: 'username'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(labelText: 'password'),
                ),
                //Page navigation does not currently work
                new TextFormField(
                  obscureText: true,
                  decoration:
                      new InputDecoration(labelText: 'confirm old password'),
                ),
                RaisedButton(
                    child: Text('Reset Password'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginScreen()),
                      );
                    }),
                new InkWell(
                    child: new Text("Dont have an account? Create one"),
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => new CreateAccountScreen()),
                      //);
                    }),
                new InkWell(
                    child: new Text("Forgot Password?"),
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => new ForgotPasswordScreen()),
                      //);
                    }),
              ],
            ))));
  }
}
