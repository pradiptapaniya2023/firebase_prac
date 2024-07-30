import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imgupload extends StatefulWidget {
  const Imgupload({super.key});

  @override
  State<Imgupload> createState() => _ImguploadState();
}

class _ImguploadState extends State<Imgupload> {
  final storageRef = FirebaseStorage.instance.ref();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMG UPLOAD --> STORAGE"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 90,
                  child: image == null
                      ? Text(
                          "No image selected",
                          style: TextStyle(color: Colors.black),
                        )
                      : null,
                  backgroundImage: image != null ? FileImage(image!) : null,
                ),
                Positioned(
                    bottom: -10,
                    left: 110,
                    child: IconButton(
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () async {
                        print("==> Pick image Inkwell");
                        ImagePicker picker = ImagePicker();
                        XFile? pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (pickedFile != null) {
                          setState(() {
                            image = File(pickedFile.path);
                          });
                        }
                      },
                      icon: Icon(Icons.add_a_photo_outlined),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                final mountainImagesRef =
                    storageRef.child("images/${Random().nextInt(1000)}.jpg");

                mountainImagesRef.putFile(File(image!.path));

              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Center(
                    child: Text(
                  "Add Firebase",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
