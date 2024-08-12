import 'package:flutter/material.dart';

class EmailAuthen extends StatefulWidget {
  const EmailAuthen({super.key});

  @override
  State<EmailAuthen> createState() => _EmailAuthenState();
}

class _EmailAuthenState extends State<EmailAuthen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EMAIL AUTHENTICATION",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
  }
}
