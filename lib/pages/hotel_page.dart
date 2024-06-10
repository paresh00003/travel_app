import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> HotelObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot = await _firestore.collection('Hotels').get();

    setState(() {
      HotelObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Hotels',style: TextStyle(color: Colors.white),),

        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: HotelObject.length,
        itemBuilder: (context, index) {
          String name = HotelObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.deepPurple),
              ),
              leading:
              Icon(Icons.pin_drop_outlined, color: Colors.deepPurple),
              trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetails(
                      place: HotelObject[index],
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

class HotelDetails extends StatelessWidget {
  final Map<String, dynamic> place;

  HotelDetails({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(place['name'],style: TextStyle(
            color: Colors.white
        ),),
        backgroundColor: Colors.deepPurple,

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
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple),
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
                  leading: Icon(Icons.map_outlined, color: Colors.deepPurple),
                  trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
                  title: Text('${place['address']}',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.send_to_mobile_sharp, color: Colors.deepPurple),
              trailing: Icon(Icons.arrow_right, color: Colors.deepPurple),
              title: GestureDetector(
                onTap: () {
                  launch('+91${place['number']}');
                },
                child: Text(' ${place['number']}',
                    style: TextStyle(fontSize: 14, color: Colors.deepPurple)),
              ),
            ),

            SizedBox(height: 8.0),
          ],
        ),

      ),
    );
  }
}
