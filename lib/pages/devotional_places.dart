import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DevotionalPlaces extends StatefulWidget {
  @override
  _DevotionalPlacesState createState() => _DevotionalPlacesState();
}

class _DevotionalPlacesState extends State<DevotionalPlaces> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> DevoPlaces = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('Devotional Places').get();

    setState(() {
      DevoPlaces = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        backgroundColor: Colors.purple.shade500,
        title: Text('Devotional Places', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: ListView.builder(
        itemCount: DevoPlaces.length,
        itemBuilder: (context, index) {
          String name = DevoPlaces[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              leading: Icon(Icons.pin_drop_outlined, color: Colors.purple.shade500),
              trailing: Icon(Icons.arrow_right, color: Colors.purple.shade500),
              title: Text(name, style: TextStyle(color: Colors.purple.shade500)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Devotional(
                      place: DevoPlaces[index],
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

class Devotional extends StatelessWidget {
  final Map<String, dynamic> place;

  Devotional({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500,
        title: Text(place['name'], style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: place['Image'] != null
                ? Image.network(
              place['Image'],
              fit: BoxFit.cover,
            )
                : SizedBox.shrink(),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text('Name: ${place['name']}', style: TextStyle(fontSize: 18, color: Colors.purple.shade500))),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade200,
            child: Text('Location: ${place['Location']}', style: TextStyle(fontSize: 16, color: Colors.purple.shade500)),
          ),
          SizedBox(height: 8.0),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text('Info: ${place['Info']}', style: TextStyle(fontSize: 16, color: Colors.purple.shade500))),
          SizedBox(height: 8.0),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Text('Timing: ${place['Timing']}', style: TextStyle(fontSize: 16, color: Colors.purple.shade500))),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Text('Contact: ${place['Contact'] ?? "No Data Available"}', style: TextStyle(fontSize: 16, color: Colors.purple.shade500)),
          ),
        ],
      ),
    );
  }
}
