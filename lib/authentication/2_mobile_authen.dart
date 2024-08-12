import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileAuthen extends StatefulWidget {
  const MobileAuthen({super.key});

  @override
  State<MobileAuthen> createState() => _MobileAState();
}

class _MobileAState extends State<MobileAuthen> {
  TextEditingController mobilecon = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";
  String otpcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MOBILE AUTHENTICATION",
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
                  controller: mobilecon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter Your Mobilenumber",
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
                  verifyPhonenumber();
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Sent OTP",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50 , left: 10 , right: 10),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter Received OTP here",
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
                  signInWithOTP();
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Enter OTP",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhonenumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '${mobilecon}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Phone number automatically verfified")));
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed ${e.message}")));
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("OTP has been sent to your phone")));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<void> signInWithOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpcode);
    await auth.signInWithCredential(credential);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Phone number verified and logged in")));
  }
}
