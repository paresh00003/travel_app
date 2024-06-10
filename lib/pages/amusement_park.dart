import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Amusement_Park extends StatefulWidget {
  @override
  _Amusement_ParkState createState() => _Amusement_ParkState();
}

class _Amusement_ParkState extends State<Amusement_Park> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> AmumentParkObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('Amusement Park').get();

    setState(() {
      AmumentParkObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.amber,
        title: Text('Amusement Park', style: TextStyle(color: Colors.white)),

      ),
      body: ListView.builder(
        itemCount: AmumentParkObject.length,
        itemBuilder: (context, index) {
          String name = AmumentParkObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              leading: Icon(Icons.pin_drop_outlined, color: Colors.amber),
              trailing: Icon(Icons.arrow_right, color: Colors.amber),
              title: Text(name, style: TextStyle(color: Colors.amber)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Amusement(
                      place: AmumentParkObject[index],
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

class Amusement extends StatelessWidget {
  final Map<String, dynamic> place;

  Amusement({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(place['name'], style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
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
            child: Text('Name: ${place['name']}', style: TextStyle(fontSize: 18, color: Colors.amber)),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white60,
            child: Text('Location: ${place['Location']}', style: TextStyle(fontSize: 16, color: Colors.amber)),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Text('Info: ${place['Info']}', style: TextStyle(fontSize: 16, color: Colors.amber)),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white60,
            child: Text('Timing: ${place['Timing']}', style: TextStyle(fontSize: 16, color: Colors.amber)),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Text('Contact: ${place['Contact']}', style: TextStyle(fontSize: 16, color: Colors.amber)),
          ),
        ],
      ),
    );
  }
}
