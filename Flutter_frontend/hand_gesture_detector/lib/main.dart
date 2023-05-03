// import 'package:alumni_connect_app/pages/education_info.dart';
// import 'package:alumni_connect_app/pages/index.dart';
// import 'package:alumni_connect_app/pages/post_page.dart';
// import 'package:alumni_connect_app/pages/signup.dart';
// import 'package:alumni_connect_app/widget/image.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/pages/login.dart';
import 'package:hand_gesture_detector/pages/signup_form.dart';
import 'package:hand_gesture_detector/widget/image.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Index(email: "goswami.4@iitj.ac.in"),
      // home: AlumniPost(email: "goswami.4@iitj.ac.in"),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class LandingPage extends StatefulWidget {
  // const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: size.height * 0.03,
            top: size.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Show your hand and get the gesture",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              CustomImage(
                ImageLink: "images/landing.jpg",
              ),
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
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpForm()),
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
            ],
          ),
        ),
      ),
    );
  }
}
