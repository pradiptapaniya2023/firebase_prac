import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '2_mobile_authen.dart';

class OtpCheck extends StatefulWidget {
  String verificationId;

  OtpCheck({super.key, required this.verificationId});

  @override
  State<OtpCheck> createState() => _OtpCheckState();
}

class _OtpCheckState extends State<OtpCheck> {
  TextEditingController otpcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP CHECK",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: TextField(
                  controller: otpcon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter OTP",
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  otpVerified();
                },
                child: Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Otp verified",
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

  Future<void> otpVerified() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: otpcon.text.trim());

      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MobileAuthen();
            },
          ));
        },
      );
    } catch (ex) {
      debugPrint("e==> ${ex.toString()}");
    }
  }
}
