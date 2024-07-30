import 'package:flutter/material.dart';

class MobileAuthen extends StatefulWidget {
  const MobileAuthen({super.key});

  @override
  State<MobileAuthen> createState() => _MobileAState();
}

class _MobileAState extends State<MobileAuthen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile Authentication",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/bg.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
