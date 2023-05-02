// import 'package:alumni_connect_app/pages/field_of_interest.dart';
// import 'package:alumni_connect_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/pages/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'login.dart';

// import 'index.dart';

class SignUpForm extends StatefulWidget {
  // bool isAlum;
  // SignUpForm({Key? key, required this.isAlum}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password, _personName, _confirmPassword;

  // signup() async {
  //   if (_formKey != null &&
  //       _formKey.currentState != null &&
  //       _formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();

  //     if (_confirmPassword != _password) {
  //       showError("Password and Confirm Password do not match");
  //     } else {
  //       Map<String, dynamic> requestPayload = {
  //         "email": _email,
  //         "password": _password,
  //         "name": _personName,
  //         // "phone": _phoneNumber
  //       };

  //       var url = Uri.parse('http://127.0.0.1:8001/api/user_signup/');
  //       var response = await http.post(
  //         url,
  //         body: jsonEncode(requestPayload),
  //       );

  //       var body = jsonDecode(response.body);
  //       if (response.statusCode == 201) {
  //         // Navigator.pushAndRemoveUntil(
  //         //     context,
  //         //     MaterialPageRoute(
  //         //         builder: (context) => FieldsOfInterest(email: _email!, isAlum: widget.isAlum)),
  //         //     (route) => false);
  //       } else {
  //         showError("Internal Server Error");
  //       }
  //     }
  //   }
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
                "Signup",
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
                                return "Enter Name";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person_add),
                            ),
                            onSaved: (input) => _personName = input!,
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
                                return "Enter Email";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                            ),
                            onSaved: (input) => _email = input!,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey.shade200,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(20))),
                        //   child: TextFormField(
                        //     validator: (input) {
                        //       if (input != null && input.isEmpty)
                        //         return "Enter Phone number";
                        //     },
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: "Phone Number",
                        //       prefixIcon: Icon(Icons.call),
                        //     ),
                        //     onSaved: (input) => _phoneNumber = input!,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
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
                        SizedBox(
                          height: 20.0,
                        ),
                        // Container(
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey.shade200,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(20))),
                        //   child: TextFormField(
                        //     validator: (input) {
                        //       if (input != null && input.isEmpty)
                        //         return "Enter password again";
                        //     },
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: "Confirm Password",
                        //       prefixIcon: Icon(Icons.lock),
                        //     ),
                        //     obscureText: true,
                        //     onSaved: (input) => _confirmPassword = input!,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                      ],
                    ),
                  ),
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
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                      child: Text(
                        "Signup",
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
                        "Already have an Account? Login",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
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
