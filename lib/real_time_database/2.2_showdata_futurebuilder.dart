import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Showdata_futurebuilder extends StatefulWidget {
  const Showdata_futurebuilder({super.key});

  @override
  State<Showdata_futurebuilder> createState() => _Showdata_futurebuilderState();
}

class _Showdata_futurebuilderState extends State<Showdata_futurebuilder> {
  List futureList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata_future();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SHOW USER DETAILS - FUTURE",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: futureList == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: futureList.length,
                    itemBuilder: (context, index) {
                      print("==> futureLength = ${futureList.length}");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              futureList[index]['imgae_link'] != null
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 70,
                                          backgroundImage: NetworkImage(
                                              futureList[index]['imgae_link']),
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      child:
                                          Text(futureList[index]['name'][0])),
                              Text(
                                "Id : ${futureList[index]['id']}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Name : ${futureList[index]['name']}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Email : ${futureList[index]['email']}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Mobile number : ${futureList[index]['mobilenumber']}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  fetchdata_future() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("user_db");

    await ref.once().then(
      (value) {
        Map map = value.snapshot.value as Map;
        map.forEach(
          (key, value) {
            futureList.add(value);
          },
        );
        print("==> future function = ${futureList}");
        setState(() {});
      },
    );
  }
}
