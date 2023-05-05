import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/main.dart';
import 'package:hand_gesture_detector/pages/index.dart';
import 'package:hand_gesture_detector/pages/signup_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password;
  List<dynamic> _topSuggestionCard = <Widget>[];
  // login() async {
    // if (_formKey != null &&
    //     _formKey.currentState != null &&
    //     _formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //   print(_email);
    //   print(_password);

    //   Map<String, dynamic> requestPayload = {
    //     "email": _email,
    //     "password": _password
    //   };

    //   var url = Uri.parse('http://127.0.0.1:8001/api/user_login/');
    //   var response = await http.post(
    //     url,
    //     body: jsonEncode(requestPayload),
    //   );

    //   var body = jsonDecode(response.body);
    //   if (response.statusCode == 200) {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => Index(email: _email!)),
        //     (route) => false);
    //   } else if (response.statusCode == 400) {
    //     showError("Invalid Credentials");
    //   }
    // }
  // }

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: size.height * 0.2,
              top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, \nWelcome Back",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: size.width * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            validator: (input) {
                              if (input != null && input.isEmpty)
                                return "Enter Email or Phone number";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or Phone number",
                              prefixIcon: Icon(Icons.email),
                            ),
                            onSaved: (input) => _email = input!,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            validator: (input) {
                              if (input != null && input.isEmpty)
                                return "Enter password";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            onSaved: (input) => _password = input!,
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      
                      onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Index()),
                    );
                  },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Text("Create account",
                  //     style: Theme.of(context).textTheme.bodyText1)
                  GestureDetector(
                      child: Text(
                        "Create Account",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpForm()),
                            (route) => false);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
