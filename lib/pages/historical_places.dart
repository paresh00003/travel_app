import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoricalPlacesScreen extends StatefulWidget {
  @override
  _HistoricalPlacesScreenState createState() => _HistoricalPlacesScreenState();
}

class _HistoricalPlacesScreenState extends State<HistoricalPlacesScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> historicalPlaces = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('Historical Places').get();

    setState(() {
      historicalPlaces = snapshot.docs
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

        backgroundColor: Colors.blue.shade500,
        title: Text('Historical Places',style: TextStyle(

          color: Colors.white
        ),),
      ),
      body: ListView.builder(
        itemCount: historicalPlaces.length,
        itemBuilder: (context, index) {
          String name = historicalPlaces[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.blue.shade500),
              ),
              leading: Icon(Icons.pin_drop_outlined, color: Colors.blue.shade500),
              trailing: Icon(Icons.arrow_right, color: Colors.blue.shade500),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoricalPlaceDetailScreen(
                      place: historicalPlaces[index],
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

class HistoricalPlaceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> place;

  HistoricalPlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(
          place['name'] ,
          style: TextStyle(color: Colors.white),
        ),

        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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

              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Name: ${place['name']}',
                style: TextStyle(fontSize: 18, color: Colors.blue.shade500),
              ),
            ),
            SizedBox(height: 8.0),
            Container(

              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: Text(
                'Location: ${place['Location']}',
                style: TextStyle(fontSize: 16, color: Colors.blue.shade500),
              ),
            ),

            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Info: ${place['Info']}',
                style: TextStyle(fontSize: 16, color: Colors.blue.shade500),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: Text(
                'Timing: ${place['Timing']}',
                style: TextStyle(fontSize: 16, color: Colors.blue.shade500),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Contact: ${place['Contact']}',
                style: TextStyle(fontSize: 16, color: Colors.blue.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
