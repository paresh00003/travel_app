import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class MallsPage extends StatefulWidget {
  @override
  _MallsPageState createState() => _MallsPageState();
}

class _MallsPageState extends State<MallsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> MallObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot = await _firestore.collection('Malls').get();

    setState(() {
      MallObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Malls',style: TextStyle(color: Colors.white),),

        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: MallObject.length,
        itemBuilder: (context, index) {
          String name = MallObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.brown),
              ),
              leading:
              Icon(Icons.pin_drop_outlined, color: Colors.brown),
              trailing: Icon(Icons.arrow_right, color: Colors.brown),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MallsDetails(
                      place: MallObject[index],
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

class MallsDetails extends StatelessWidget {
  final Map<String, dynamic> place;

  MallsDetails({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(place['name'],style: TextStyle(
            color: Colors.white
        ),),
        backgroundColor: Colors.brown,

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
                  style: TextStyle(fontSize: 18, color: Colors.brown),
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
                  leading: Icon(Icons.map_outlined, color: Colors.brown),
                  trailing: Icon(Icons.arrow_right, color: Colors.brown),
                  title: Text('${place['Address']}',
                      style: TextStyle(fontSize: 16, color: Colors.brown)),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.send_to_mobile_sharp, color: Colors.brown),
              trailing: Icon(Icons.arrow_right, color: Colors.brown),
              title: GestureDetector(
                onTap: () {
                  launch('+91${place['Contact']}');
                },
                child: Text(' ${place['Contact']}',
                    style: TextStyle(fontSize: 14, color: Colors.brown)),
              ),
            ),

            SizedBox(height: 8.0),
          ],
        ),

      ),
    );
  }
}
