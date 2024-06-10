import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DistancePage extends StatefulWidget {
  @override
  _DistancePageState createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> DistanceObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('Distance').get();

    setState(() {
      DistanceObject = snapshot.docs
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

        backgroundColor: Colors.lightBlue,
        title: Text('Distance',style: TextStyle(

            color: Colors.white
        ),),
      ),
      body: ListView.builder(
        itemCount: DistanceObject.length,
        itemBuilder: (context, index) {
          String name = DistanceObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16
                ),
                textAlign: TextAlign.center,
              ),

              leading: Icon(Icons.swap_horiz_outlined, color: Colors.lightBlue,
              size: 16,
              ),
              trailing: Text(DistanceObject[index]['km'],style: TextStyle(
                  color: Colors.lightBlue,
                fontSize: 16
              ),),
            ),
          );
        },
      ),
    );
  }
}


