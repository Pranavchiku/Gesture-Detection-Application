import 'dart:io';
// import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:hand_gesture_detector/main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cross_file/cross_file.dart';

class TextRecognitionWidget extends StatefulWidget {
  File? image;
  TextRecognitionWidget({Key? key, this.image});

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';

  Future<void> _takePicture() async {
    ImagePicker picker = ImagePicker();
    final imageFile = await picker.getImage(source: ImageSource.camera);
    // final imageFile = await ImagePicker.pickImage(
    //   source: ImageSource.camera,
    //   maxWidth: 600,
    // );
    setState(() {
      widget.image = imageFile as File?;
    });
  }

  // Future<Null> _cropImage() async {
  //   File? croppedFile = await ImageCropper().cropImage(
  //       sourcePath: widget.image!.path,
  //       aspectRatioPresets: Platform.isAndroid
  //           ? [
  //               CropAspectRatioPreset.square,
  //               CropAspectRatioPreset.ratio3x2,
  //               CropAspectRatioPreset.original,
  //               CropAspectRatioPreset.ratio4x3,
  //               CropAspectRatioPreset.ratio16x9
  //             ]
  //           : [
  //               CropAspectRatioPreset.original,
  //               CropAspectRatioPreset.square,
  //               CropAspectRatioPreset.ratio3x2,
  //               CropAspectRatioPreset.ratio4x3,
  //               CropAspectRatioPreset.ratio5x3,
  //               CropAspectRatioPreset.ratio5x4,
  //               CropAspectRatioPreset.ratio7x5,
  //               CropAspectRatioPreset.ratio16x9
  //             ],
  //       androidUiSettings: AndroidUiSettings(
  //         toolbarTitle: 'Cropper',
  //         toolbarColor: Colors.black,
  //         toolbarWidgetColor: Colors.white,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         lockAspectRatio: false,
  //         showCropGrid: true,
  //         activeControlsWidgetColor: Colors.orange,
  //       ),
  //       iosUiSettings: IOSUiSettings(
  //         title: 'Crop the image',
  //       ));
  //   if (croppedFile != null) {
  //     setState(() {
  //       widget.image = croppedFile;
  //     });
  //     // setState(() {
  //     //   state = AppState.cropped;
  //     // });
  //   }
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Colors.black,
          onPressed: () {
            // _cropImage();
          },
          child: Icon(Icons.crop),
        ),
        body: Column(
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
            Expanded(child: buildImage()),
            const SizedBox(height: 16),
            // ControlsWidget(
            //   image: widget.image!,
            //   onClickedPickImage: _takePicture,
            //   onClickedScanText: scanText,
            //   onClickedClear: clear,
            // ),
            const SizedBox(height: 40),
            // TextAreaWidget(
            //   text: text,
            //   onClickedCopy: copyToClipboard,
            // ),
          ],
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
                  onPressed: () {},
                ),
                // IconButton(
                //   icon: Icon(Icons.camera_alt_rounded, color: Colors.black),
                //   onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
                //   },
                // ),
                IconButton(
                  icon: Icon(Icons.photo, color: Colors.black),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => TextRecognitionWidget()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.black),
                  onPressed: () {},
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
        // FirebaseAuth.instance.signOut();
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

  Widget buildImage() => Container(
        child: widget.image != null
            ? Image.file(widget.image!)
            : Icon(Icons.photo, size: 80, color: Colors.black),
      );

  // Future pickImage() async {
  //   // final file = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   // final file = await FilePicker.platform.pickFiles(
  //   //                   type: FileType.custom,
  //   //                   allowedExtensions: ['png', 'jpg', 'jpeg']) as File;

  //   XFile? image = await ImagePicker()
  //                     .pickImage(source: ImageSource.gallery);
  //                 final file = File(image!.path);
  //   print(file);
  //   print("MILEGAAAA");
  //   print(File(file.path));

  //   setState(() {
  //     image = File(file.path) as XFile?;
  //   });
  //   // setImage(File(file.path));

  // }

  Future scanText() async {
    // showDialog(
    //   context: context,
    //   child: Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );

    // final text = await FirebaseMLApi.recogniseText(widget.image!);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ScanTextOutput(
    //               text: text,
    //             )));

    // print(text);
    // setText(text);

    // Navigator.of(context).pop();
  }

  void clear() {
    widget.image = null;
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      // FlutterClipboard.copy(text);
    }
  }

  void setImage(File newImage) {
    setState(() {
      widget.image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
