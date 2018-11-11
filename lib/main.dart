import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'CreateAccountScreen.dart';
import 'ResetPassword.dart';
import 'HomeScreen.dart';
import 'Globals.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new HouseHawk());

var loggedIn = new Singleton();
var fName = new Singleton();
var lName = new Singleton();
var emailAddress = new Singleton();
var password = new Singleton();

class HouseHawk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new LoginScreen());
  }
}

/*
  This file is is the login screen for the HouseHawk mobile application.
  It includes text fields for username and password.
  It includes a button to login to the home screen as well as links to create an
  account or reset you password
  ForgotPasswordScreen is also not created yet. (line 59)
 */
class LoginScreen extends StatelessWidget {
  String emailAddress = '';

  //String password = '';
  //String fName = '';

  //TextEditingController email = new TextEditingController();
  //TextEditingController pass = new TextEditingController();
  String url = 'http://52.91.107.223:5000/';

  Future<Post> fetchPost() async {
    //String em, String pass
//      em = emailAddress;
//      pass = password;
    print('hello');
    final response = await http
        .get('http://52.91.107.223:5000/user/email_address/example@rowan.edu');
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('did work');
      //

      //
      print(response.body);
      return Post.fromJson(json.decode(response.body));
    } else {
      print('didnt work');
      throw Exception('Failed to load post');
    }
  }

//  getData()async{
//    String profile = url;
//      var res =  await http.get(profile); //headers: {"Accept":"application/json"}
//      print(res);
//      var resBody = json.decode(res.body);
//      emailAddress = resBody['email_address'];
//      password = resBody['password'];
//      fName = resBody['fName'];
////      setState(() {
////        print("Success");
////      });
//  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Login page',
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'Login Screen',
              ),
            ),
            body: new Container(
                child: new ListView(
              children: <Widget>[
                new TextFormField(
                  //controller: email,
                  decoration: new InputDecoration(labelText: 'EmailAddress'),
                  keyboardType: TextInputType.text,
                ),
                new TextFormField(
                  //controller: pass,
                  obscureText: true,
                  decoration: new InputDecoration(labelText: 'password'),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () => fetchPost(),
                  //onPressed: ()=> fetchPost(email_address,password),
                ),
                new InkWell(
                    child: new Text("Dont have an account? Create one"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new CreateAccountScreen()),
                      );
                    }),
                new InkWell(
                    child: new Text("Forgot Password?"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()),
                      );
                    }),
                new InkWell(
                    child: new Text("Continue with out loggoing in"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }),
                //new Text("Email Address : $emailAddress"),
                //new Text("Password : $password"),
                //new Text("First Name : $fName"),
              ],
            ))));
  }
}

class Post {
  final String email_address;
  final String fname;
  final String lname;
  final String password;
  final String phone_id;
  final int user_id;

  Post(
      {this.email_address,
      this.fname,
      this.lname,
      this.password,
      this.phone_id,
      this.user_id});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      email_address: json['email_address'],
      fname: json['fname'],
      lname: json['lname'],
      password: json['password'],
      phone_id: json['phone_id'],
      user_id: json['user_id'],
    );
  }

  getID() {
    return user_id;
  }
}
