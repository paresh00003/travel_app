import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlacesToSeeAroundage extends StatefulWidget {
  @override
  _PlacesToSeeAroundageState createState() => _PlacesToSeeAroundageState();
}

class _PlacesToSeeAroundageState extends State<PlacesToSeeAroundage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> AroundObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('PlacesToSeeAround').get();

    setState(() {
      AroundObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        backgroundColor: Colors.teal,
        title: Text('Places To See Around',style: TextStyle(
            color: Colors.white
        ),),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: AroundObject.length,
        itemBuilder: (context, index) {
          String name = AroundObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.teal),
              ),
              leading: Icon(
                Icons.pin_drop_outlined,
                color: Colors.teal,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.teal,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AroundPage(
                      place: AroundObject[index],
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

class AroundPage extends StatelessWidget {
  final Map<String, dynamic> place;

  AroundPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(place['name'] ,style: TextStyle(
            color: Colors.white
        ),),

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

              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Name: ${place['name']}',
                style: TextStyle(fontSize: 18, color: Colors.teal),
              ),
            ),
            SizedBox(height: 8.0),



            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Text(
                'Location: ${place['Location']}',
                style: TextStyle(fontSize: 16, color: Colors.teal),
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
                style: TextStyle(fontSize: 16, color: Colors.teal),
              ),
            ),





          ],
        ),
      ),

    );
  }
}
