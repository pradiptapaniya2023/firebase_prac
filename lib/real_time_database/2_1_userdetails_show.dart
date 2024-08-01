import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Show_userdata extends StatefulWidget {
  const Show_userdata({super.key});

  @override
  State<Show_userdata> createState() => _Show_userdataState();
}

class _Show_userdataState extends State<Show_userdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SHOW USER DETAILS",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance.ref().onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            Map data = snapshot.data!.snapshot.value as Map;
            print("==>data = ${data}");
            List itemList = data.values.toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemList[index]['imgae_link'] != null
                            ? Container(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                    itemList[index]['imgae_link']))
                            : CircleAvatar(
                                child: Text(itemList[index]['name'][0])),
                        Text(itemList[index]['name']),
                        Text(itemList[index]['email']),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
