import 'package:flutter/material.dart';
import 'main.dart';

//dummy page used to test api endpoint
class DummyEndpoint extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Dummy Page',
        home: new Scaffold(
            appBar: new AppBar(
              title:new Text(
                'Reset Password',
              ),
            ),
            body:new Container(
                child:new ListView(
                  children: <Widget>[

                    //new Text ("Email : $email_address"),
                    new Text ("fname : $fName"),
                    new Text ("lname : $lName"),
                    new Text("password : $password"),
                    //new Text("phone_id : $phone_id"),
                    //new Text("user_id : $user_id"),

                    RaisedButton(child: Text('Logout'),
                        onPressed: () {
                          Navigator.push(
                            context, new MaterialPageRoute(builder: (context) => new LoginScreen()),
                          );
                        })
                  ],
                )
            )
        )
    );
  }
}

