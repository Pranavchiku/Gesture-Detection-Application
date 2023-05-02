import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlumniCard extends StatefulWidget {
  String name;
  String imageLink;
  String email_from;
  String email_to;
  AlumniCard(
      {required this.name,
      required this.imageLink,
      required this.email_from,
      required this.email_to});

  @override
  State<AlumniCard> createState() => _AlumniCardState();
}

class _AlumniCardState extends State<AlumniCard> {
  bool requestProcessing = false;
  bool tick = false;

  sendRequest() async {
    setState(() {
      requestProcessing = true;
    });

    Map<String, dynamic> requestPayload = {
      "email_from": widget.email_from,
      "email_to": widget.email_to
    };

    var url = Uri.parse('http://127.0.0.1:8001/api/connect_user/');
    var response = await http.post(
      url,
      body: jsonEncode(requestPayload),
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        requestProcessing = false;
        tick = true;
      });
    } else {
      showError("Internal Server Error");
    }
  }

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
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      height: 80,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(widget.imageLink),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: sendRequest,
            child: requestProcessing
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : tick
                    ? Icon(
                        Icons.check,
                      )
                    : Icon(
                        Icons.arrow_right,
                      ),
          )
        ],
      ),
    );
  }
}
