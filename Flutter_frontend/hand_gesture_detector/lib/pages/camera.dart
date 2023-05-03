// import 'dart:convert';
// import 'dart:typed_data';

// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:hand_gesture_detector/main.dart';
// import 'package:hand_gesture_detector/pages/temp2.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:ocr_application/firebase_ml_api.dart';
// // import 'package:ocr_application/main.dart';
// // import 'package:ocr_application/scanTextOutput.dart';
// // import 'package:ocr_application/temp.dart';
// // import 'package:ocr_application/tempharshi.dart';
// // import 'package:ocr_application/textToSpeech.dart';
// // import 'package:ocr_application/text_recognisation_widget.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:ocr_application/userProfile.dart';

// class Index extends StatefulWidget {
//   const Index({Key? key}) : super(key: key);

//   @override
//   State<Index> createState() => _IndexState();
// }

// class _IndexState extends State<Index> {
//   List<String>? nameOfDocs = [];
//   int i = 0;
//   // getCountOfDocs() async {
//   //   var data = await FirebaseStorage.instance
//   //       .ref()
//   //       .child("${FirebaseAuth.instance.currentUser!.displayName}")
//   //       .listAll();
//   //   data.items.forEach(
//   //     (element) => {
//   //       print("here it is"),
//   //       setState(() {
//   //         i = i + 1;
//   //         nameOfDocs!.insert(0, element.name);
//   //       }),
//   //     },
//   //   );
//   // }

//   late String scannedText;
//   // final FirebaseAuth _auth = FirebaseAuth.instance;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late String _searchValue;
//   @override
//   void initState() {
//     // this.checkAuthentification();
//     // this.getCountOfDocs();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Container(
//         child: Align(
//           alignment: Alignment.bottomRight,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               FloatingActionButton(
//                 backgroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15.0))),
//                 onPressed: () async {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => TextRecognitionWidget()));
//                    ImagePicker picker = ImagePicker();
// final imageFile = await picker.getImage(source: ImageSource.camera);
                 
//                   if (imageFile == null) {
//                     print("file null hai");
//                   }
//                   // final text = await FirebaseMLApi.recogniseText(imageFile);
//                   else {
//                     setState(() {
//                       // scannedText = text;
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => TextRecognitionWidget(
//                       //               image: imageFile,
//                       //             )));
//                     });
//                   }
//                 },
//                 child: Icon(
//                   Icons.camera_alt_outlined,
//                 ),
//               ),
//               SizedBox(width: 10),
//               FloatingActionButton(
//                 backgroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15.0))),
//                 onPressed: () async {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => TextRecognitionWidget()));
//                    ImagePicker picker = ImagePicker();
// final imageFile = await picker.getImage(source: ImageSource.camera);
//                   // final imageFile = await ImagePicker.pickImage(
//                   //   source: ImageSource.gallery,
//                   //   maxWidth: 600,
//                   // );
//                   if (imageFile == null) {
//                     print("file null hai");
//                   }
//                   // final text = await FirebaseMLApi.recogniseText(imageFile);
//                   else {
//                     setState(() {
//                       // scannedText = text;
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => TextRecognitionWidget(
//                       //               image: imageFile,
//                       //             )));
//                     });
//                   }
//                 },
//                 child: Icon(
//                   Icons.photo,
//                 ),
//               ),
//               // FloatingActionButton(
//               //   onPressed: () {},
//               //   child: Icon(
//               //     Icons.photo_album_rounded,
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       body: NestedScrollView(
//         headerSliverBuilder: (context, value) {
//           return [
//             SliverToBoxAdapter(
//                 child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 60,
//                   ),
//                   Text(
//                     "Get all your pdfs and docs at a places",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey.shade800,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 46,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Form(
//                       key: _formKey,
//                       child: TextFormField(
//                         validator: (input) {
//                           if (input != null && input.isEmpty)
//                             return "Search Something";
//                         },
//                         cursorColor: Colors.black,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Colors.grey.shade700,
//                           ),
//                           border: InputBorder.none,
//                           hintText: "Search ",
//                           hintStyle: TextStyle(color: Colors.grey.shade500),
//                         ),
//                         onSaved: (input) => _searchValue = input!,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ))
//           ];
//         },
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               for (var a = 0; a < i; a = a + 1)
//                 GestureDetector(
//                   onTap: () async {
//                     // FirebaseStorage storage = FirebaseStorage.instance;
//                     // Reference ref = storage.ref().child('${nameOfDocs![a]}' ==
//                     //         nameOfDocs![a]
//                     //     ? "${FirebaseAuth.instance.currentUser!.displayName}/${nameOfDocs![a]}"
//                     //     : "${FirebaseAuth.instance.currentUser!.displayName}/${i - a - 1}.mp3");
//                     // Uint8List? downloadedData = await ref.getData();
//                     // String textHere = (utf8.decode(downloadedData!));

//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => ScanTextOutput(
//                     //               text: textHere,
//                     //             )));
//                   },
//                   child: Card(
//                     elevation: 8.0,
//                     margin: new EdgeInsets.symmetric(
//                         horizontal: 10.0, vertical: 6.0),
//                     // shape: ,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(
//                           10,
//                         ),
//                       ),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         leading: Container(
//                           padding: EdgeInsets.only(right: 12.0),
//                           decoration: new BoxDecoration(
//                               // borderRadius: BorderRadius.circular(
//                               //           50,
//                               //         ),
//                               border: new Border(
//                                   right: new BorderSide(
//                                       width: 1.0, color: Colors.black))),
//                           child: GestureDetector(
//                             child:
//                                 Icon(Icons.keyboard_voice, color: Colors.black),
//                             onTap: () async {
//                               // FirebaseStorage storage =
//                               //     FirebaseStorage.instance;
//                               // Reference ref = storage.ref().child(
//                               //     '${nameOfDocs![a]}' == nameOfDocs![a]
//                               //         ? "${FirebaseAuth.instance.currentUser!.displayName}/${nameOfDocs![a]}"
//                               //         : "${FirebaseAuth.instance.currentUser!.displayName}/${i - a - 1}.mp3");
//                               // Uint8List? downloadedData = await ref.getData();
//                               // String textHere = (utf8.decode(downloadedData!));

//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => TextToSpeech(
//                               //               newVoiceText: textHere,
//                               //             )));
//                             },
//                           ),
//                         ),
//                         title: GestureDetector(
//                           child: Text(
//                             nameOfDocs![a],
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           onTap: () async {
//                             // FirebaseStorage storage = FirebaseStorage.instance;
//                             // Reference ref = storage.ref().child('${nameOfDocs![a]}' ==
//                             //         nameOfDocs![a]
//                             //     ? "${FirebaseAuth.instance.currentUser!.displayName}/${nameOfDocs![a]}"
//                             //     : "${FirebaseAuth.instance.currentUser!.displayName}/${i - a - 1}.mp3");
//                             // Uint8List? downloadedData = await ref.getData();
//                             // // String textHere = (utf8.decode(downloadedData!));

//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (context) => ScanTextOutput(
//                             //               text: textHere,
//                             //             )));
//                           },
//                         ),
//                         // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//                         subtitle: Row(
//                           children: <Widget>[
//                             Icon(Icons.linear_scale, color: Colors.black),
//                             Text("Date", style: TextStyle(color: Colors.black))
//                           ],
//                         ),
//                         trailing: GestureDetector(
//                             child: Icon(Icons.share,
//                                 color: Colors.black, size: 30.0),
//                             onTap: () async {
//                               print('${i - a - 1}.txt');
//                               print(nameOfDocs![a]);
                

//                               // await FlutterShare.share(
//                               //     title: 'HMI OCR Share',
//                               //     text: 'My File',
//                                   // linkUrl:
//                                       // (await ref.getDownloadURL()).toString(),
//                                   // chooserTitle: 'Example Chooser Title');
//                             }),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         // body: Container(
//         //   child: ListView.builder(
//         //     scrollDirection: Axis.vertical,
//         //     shrinkWrap: true,
//         //     itemCount: 1,
//         //     itemBuilder: (BuildContext context, int index) {
//         //       return Card(
//         //         elevation: 8.0,
//         //         margin:
//         //             new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//         //         // shape: ,
//         //         child: Container(
//         //           decoration: BoxDecoration(
//         //             color: Colors.white,
//         //             borderRadius: BorderRadius.circular(
//         //               10,
//         //             ),
//         //           ),
//         //           child: ListTile(
//         //             contentPadding:
//         //                 EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         //             leading: Container(
//         //               padding: EdgeInsets.only(right: 12.0),
//         //               decoration: new BoxDecoration(
//         //                   // borderRadius: BorderRadius.circular(
//         //                   //           50,
//         //                   //         ),
//         //                   border: new Border(
//         //                       right: new BorderSide(
//         //                           width: 1.0, color: Colors.black))),
//         //               child: Icon(Icons.autorenew, color: Colors.black),
//         //             ),
//         //             title: Text(
//         //               "Document",
//         //               style: TextStyle(
//         //                   color: Colors.black, fontWeight: FontWeight.bold),
//         //             ),
//         //             // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//         //             subtitle: Row(
//         //               children: <Widget>[
//         //                 Icon(Icons.linear_scale, color: Colors.black),
//         //                 Text("Date", style: TextStyle(color: Colors.black))
//         //               ],
//         //             ),
//         //             trailing: Icon(Icons.keyboard_arrow_right,
//         //                 color: Colors.black, size: 30.0),
//         //           ),
//         //         ),
//         //       );
//         //     },
//         //   ),
//         // ),
//       ),
//       bottomNavigationBar: Container(
//         height: 55.0,
//         child: BottomAppBar(
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.home, color: Colors.black),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Index()));
//                 },
//               ),
//               // IconButton(
//               //   icon: Icon(Icons.camera_alt_rounded, color: Colors.black),
//               //   onPressed: () {
//               // Navigator.push(context,
//               //     MaterialPageRoute(builder: (context) => HomePage()));
//               //   },
//               // ),
//               // IconButton(
//               //   icon: Icon(Icons.photo, color: Colors.black),
//               //   onPressed: () {},
//               // ),
//               IconButton(
//                 icon: Icon(Icons.person, color: Colors.black),
//                 onPressed: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => CompleteProfileScreen()));
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.logout, color: Colors.black),
//                 onPressed: () {
//                   showAlertDialog(context);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   showAlertDialog(BuildContext context) {
//     // set up the button
//     // Widget logOutButton = SalomonBottomBarItem(
//     //   icon: Icon(Icons.logout),
//     //   title: Text("LogOut"),
//     //   selectedColor: Colors.redAccent,
//     // );
//     Widget okButton = TextButton(
//       child: Text("Logout"),
//       onPressed: () {
//         // _auth.signOut();
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => HomePage()));
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (context) => LandingPage()),
//             (route) => false);
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Logout Alert!!"),
//       content: Text("Are you sure you want to logout?"),
//       actions: [
//         okButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/main.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      // body: Image.file(File(imagePath)),
      body:Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Image Preview",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            Expanded(child: Image.file(File(imagePath)),),
            const SizedBox(height: 16),
            // Text(
            //add a button
           TextButton(
                      
                      onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisplayResult()),
                    );
                  },
                      child: Text(
                        "Predict",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
            const SizedBox(height: 40),
            // TextAreaWidget(
            //   text: text,
            //   onClickedCopy: copyToClipboard,
            // ),
          ],
        ),
     
    );
  }
}
class DisplayResult extends StatelessWidget {
  // final String imagePath;
//  final String imagePath;

  const DisplayResult();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Predicted Results')), 
        body:Column(
          children: [
            SizedBox(
              height: 60,
            ),
            for (var i = 0; i < 2; i++)
            Text(
              
              
              "Predicted gesture is: $i ",
              
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            // Expanded(child: Image.file(File(imagePath)),),
            const SizedBox(height: 16),
            // Text(
            //add a button
           TextButton(
                      
                      onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
            const SizedBox(height: 40),
           
          ],
        ),
     
    );
  }
}
