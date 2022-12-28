import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Analyse extends StatefulWidget {
  const Analyse({super.key});

  @override
  State<Analyse> createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  String path = '';
  File? myFile;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Choose an image to classify it",
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * .08),
              InkWell(
                onTap: (() => pickImage()),
                child: Container(
                  height: height * .4,
                  width: width * 0.9,
                  margin: EdgeInsets.symmetric(horizontal: width * .05),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: path == ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 75,
                            ),
                            Text("Please choose an image to classify")
                          ],
                        )
                      : Image.file(
                          myFile!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: height * .2,
              ),
              ElevatedButton(onPressed: (() {}), child: const Text("Classify")),
            ],
          ),
        ),
      ),
    );
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      path = image!.path;
      myFile = File(path);
    });
  }
}
