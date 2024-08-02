import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Showdata_strambuilder extends StatefulWidget {
  const Showdata_strambuilder({super.key});

  @override
  State<Showdata_strambuilder> createState() => _Showdata_strambuilderState();
}

class _Showdata_strambuilderState extends State<Showdata_strambuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata_stream();
  }

  List streamList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SHOW USER DETAILS - STREAM",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: streamList.length,
          itemBuilder: (context, index) {
            print("==> streamLength = ${streamList.length}");
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      streamList[index]['imgae_link'] != null
                          ? Center(
                              child: CircleAvatar(radius: 70,
                                backgroundImage: NetworkImage(
                                    streamList[index]['imgae_link']),
                              ),
                            )
                          : CircleAvatar(
                              child: Text(streamList[index]['name'][0])),
                      Text(
                        "id : ${streamList[index]['id']}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(streamList[index]['name']),
                      Text(streamList[index]['email']),
                      Text(streamList[index]['mobilenumber']),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  fetchdata_stream() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("user_db");

    streamList.clear();
    ref.onValue.listen(
      (event) {
        Map map = event.snapshot.value as Map;
        map.forEach(
          (key, value) {
            streamList.add(value);
          },
        );
        print("==> stream function = ${streamList}");
      },
    );
  }
}
