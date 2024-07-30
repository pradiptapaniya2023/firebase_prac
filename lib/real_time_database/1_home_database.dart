import 'package:flutter/material.dart';

import '2_user_details_db.dart';

class Realtimedatabase extends StatefulWidget {
  const Realtimedatabase({super.key});

  @override
  State<Realtimedatabase> createState() => _RealtimedatabaseState();
}

class _RealtimedatabaseState extends State<Realtimedatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REAL TIME DATABASE HOMEPAGE",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Userdetails_db();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Text(
                      "1. User details database",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
