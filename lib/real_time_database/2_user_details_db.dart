import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.only(top: 190 , left: 10 , right: 10 , bottom: 10),
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
                      });

                      setState(() {
                        name.text = "";
                        email.text = "";
                        monumber.text = "";
                        password.text = "";
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
              ],
            )));
  }
}
