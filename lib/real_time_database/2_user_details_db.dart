import 'dart:io';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '2_1_userdetails_show.dart';

class Userdetails_db extends StatefulWidget {
  const Userdetails_db({super.key});

  @override
  State<Userdetails_db> createState() => _Userdetails_dbState();
}

class _Userdetails_dbState extends State<Userdetails_db> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController monumber = TextEditingController();
  TextEditingController password = TextEditingController();
  String? dowURL;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "USER DB - FIREBASE",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: image != null ? FileImage(image!) : null,
                    child: image == null
                        ? Text(
                            "No image selected",
                            style: TextStyle(color: Colors.black),
                          )
                        : null,
                  ),
                  Positioned(
                      top: 120,
                      left: 130,
                      child: IconButton(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? pickImage = await picker.pickImage(
                              source: ImageSource.gallery);

                          if (pickImage != null) {
                            image = File(pickImage.path);

                            final storageRef = FirebaseStorage.instance.ref();
                            final mountainImagesRef = storageRef.child(
                                "userdata_db/image${Random().nextInt(1000)}.jpg");
                            await mountainImagesRef.putFile(File(image!.path));
                            dowURL = await mountainImagesRef.getDownloadURL();

                            print("==> imageURL = ${dowURL}");
                            print("==> Image path : ${image}");

                            setState(() {});
                          }
                        },
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          size: 30,
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "Name",
                        labelStyle: TextStyle(fontSize: 20),
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.text,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 20),
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.emailAddress,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: monumber,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "Mobilenumber",
                        labelStyle: TextStyle(fontSize: 20),
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.number,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 20),
                        contentPadding: EdgeInsets.all(10)),
                    keyboardType: TextInputType.text,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  DatabaseReference ref = FirebaseDatabase.instance.ref();

                  await ref.push().set({
                    "name": name.text,
                    "email": email.text,
                    "mobilenumber": monumber.text,
                    "pass": password.text,
                    "imgae_link": dowURL!,
                  });

                  setState(() {
                    name.text = "";
                    email.text = "";
                    monumber.text = "";
                    password.text = "";
                    image = null;
                    dowURL = null;
                  });
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Add Data",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Show_userdata();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Show Data",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
