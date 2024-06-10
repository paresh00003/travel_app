import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CinemasPage extends StatefulWidget {
  @override
  _CinemasPageState createState() => _CinemasPageState();
}

class _CinemasPageState extends State<CinemasPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> CinemasObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot = await _firestore.collection('Cinemas').get();

    setState(() {
      CinemasObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Cinemas',style: TextStyle(color: Colors.white),),

        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: CinemasObject.length,
        itemBuilder: (context, index) {
          String name = CinemasObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.indigo),
              ),
              leading:
                  Icon(Icons.pin_drop_outlined, color: Colors.indigo),
              trailing: Icon(Icons.arrow_right, color: Colors.indigo),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Movies(
                      place: CinemasObject[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Movies extends StatelessWidget {
  final Map<String, dynamic> place;

  Movies({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(place['name'],style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.indigo,

        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.10,
              ),
              child: Center(
                child: Text(
                  ' ${place['name']}',
                  style: TextStyle(fontSize: 18, color: Colors.indigo),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Divider(color: Colors.indigo),
            SizedBox(height: 8.0),
            SingleChildScrollView(
              child: Container(
                height: 50,
                child: ListTile(
                  leading: Icon(Icons.map_outlined, color: Colors.indigo),
                  trailing: Icon(Icons.arrow_right, color: Colors.blue.shade500),
                  title: Text('${place['Address']}',
                      style: TextStyle(fontSize: 16, color: Colors.indigo)),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.send_to_mobile_sharp, color: Colors.indigo),
              trailing: Icon(Icons.arrow_right, color: Colors.blue.shade500),
              title: GestureDetector(
                onTap: () {
                  launch('+91${place['Contact']}');
                },
                child: Text(' ${place['Contact']}',
                    style: TextStyle(fontSize: 14, color: Colors.indigo)),
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.circle_rounded, color: Colors.indigo),
              trailing: Icon(Icons.arrow_right, color: Colors.blue.shade500),
              title: GestureDetector(
                onTap: () async {
                  if (await canLaunch(place['Web'])) {
                    await launch(place['Web']);
                  } else {
                    throw 'Could not launch ${place['Web']}';
                  }
                },
                child: Text('${place['Web']}',
                    style: TextStyle(fontSize: 14, color: Colors.indigo)),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),

      ),
    );
  }
}
