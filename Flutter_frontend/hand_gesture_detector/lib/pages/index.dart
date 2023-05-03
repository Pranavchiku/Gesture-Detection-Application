import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/pages/camera.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import '../main.dart';
import '../widget/gesture_card.dart';

class ConnectionPage extends StatefulWidget {
  @override
  State<ConnectionPage> createState() => ConnectionPageState();
}

class ConnectionPageState extends State<ConnectionPage> {
  List alumniList = [];
  var imageFile;

  @override
  void initState() {
    super.initState();
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
      floatingActionButton: Container(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () async {
                  setState(() async {
                    var image_picker = ImagePicker();
                    imageFile = await image_picker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 600,
                    );
                  });

                  if (imageFile == null) {
                    print("file null hai");
                  }
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () async {
                  setState(() async {
                    var image_picker = ImagePicker();
                    imageFile = await image_picker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 600,
                    );
                  });

                  if (imageFile == null) {
                    print("file null hai");
                  }
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => TextRecognitionWidget()));
                  // final imageFile = await ImagePicker.pickImage(
                  //   source: ImageSource.gallery,
                  //   maxWidth: 600,
                  // );
                  // if (imageFile == null) {
                  //   print("file null hai");
                  // }
                },
                child: Icon(
                  Icons.photo,
                ),
              ),
            ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBar(size: size),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              for (var i = 0; i < 2; i++)
                GestureCards(
                  name: "Gesture $i",
                  imageLink: "images/landing.jpg",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandingPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.camera, color: Colors.black),
                onPressed: () async {
                  await availableCameras().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TakePictureScreen(camera: value.first),
                      ),
                    ),
                  );
                },
              ),
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
  Widget okButton = TextButton(
    child: Text("Logout"),
    onPressed: () {
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


