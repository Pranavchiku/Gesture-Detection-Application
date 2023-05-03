// import 'package:alumni_connect_app/main.dart';
// import 'package:alumni_connect_app/pages/index.dart';
// import 'package:alumni_connect_app/pages/post_page.dart';
// import 'package:alumni_connect_app/widget/alumni_card.dart';
import 'package:camera/camera.dart';
// import 'package:hand_gesture_detector/pages/temp1.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/pages/camera.dart';
// import 'package:hand_gesture_detector/pages/temp2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';
import '../widget/alumni_card.dart';

class ConnectionPage extends StatefulWidget {
  // String email;

  // ConnectionPage({required this.email});

  @override
  State<ConnectionPage> createState() => ConnectionPageState();
}


class ConnectionPageState extends State<ConnectionPage> {
  List alumniList = [];

  fetchAlumni() async {
    var url = Uri.parse("http://127.0.0.1:8001/api/get_all_users/");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var items = json.decode(response.body) as List;
      setState(() {
        //iterate over the list and add the items to the list whose email is not equal to the current user's email
        for (var item in items) {
          // if (item['email'] != widget.email) {
            alumniList.add(item);
          // }
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlumni();
  }

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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "All files",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SearchBar(size: size),
                  
                  

              for (var i = 0; i < 2; i++)
                AlumniCard(
                  name: "Gesture $i",
                  email_to: "Email $i",
                  imageLink: "assets/student-min.jpg",
                  email_from: "abc@gmail.com"
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LandingPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.camera, color: Colors.black),
                onPressed: () async{
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context, 
                      // MaterialPageRoute(builder: (context) => CameraExampleHome(),
                      
                      MaterialPageRoute(builder: (context) => TakePictureScreen(camera: value.first), ),
                      ),
                    // ),
                  );
                  // Navigator.push(
                  //   context,
                    // MaterialPageRoute(
                        // builder: (context) =>
                            // ConnectionPage(email: widget.email)),
                  // );
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.add_box_outlined, color: Colors.black),
              //   onPressed: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //       builder: (context) => AlumniPost(email: widget.email)),
              //     // );
              //   },
              // ),
              IconButton(
                icon: Icon(Icons.logout, color: Colors.black),
                onPressed: () {
                  showAlertDialog(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  // Widget logOutButton = SalomonBottomBarItem(
  //   icon: Icon(Icons.logout),
  //   title: Text("LogOut"),
  //   selectedColor: Colors.redAccent,
  // );
  Widget okButton = TextButton(
    child: Text("Logout"),
    onPressed: () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LandingPage()),
          (route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout Alert!!"),
    content: Text("Are you sure you want to logout?"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  
}
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          )
        ],
      ),
      child: TextFormField(
        onChanged: (string) {},
        obscureText: false,
        validator: (input) {
          if (input != null && input.isEmpty) {
            return "Please enter some text";
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
          ),
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


