import 'package:flutter/material.dart';
import '2_img_upload.dart';

class Storagehome extends StatefulWidget {
  const Storagehome({super.key});

  @override
  State<Storagehome> createState() => _StoragehomeState();
}

class _StoragehomeState extends State<Storagehome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STORAGE HOMEPAGE",
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
                    return Imgupload();
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
                      "Image upload",
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
