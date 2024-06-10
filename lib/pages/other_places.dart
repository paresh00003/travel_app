import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OtherPlacesPage extends StatefulWidget {
  @override
  _OtherPlacesPageState createState() => _OtherPlacesPageState();
}

class _OtherPlacesPageState extends State<OtherPlacesPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> OtherPlacesObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('Other Places').get();

    setState(() {
      OtherPlacesObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        backgroundColor: Colors.orange,
        title: Text('Other Places',style: TextStyle(
            color: Colors.white
        ),),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: OtherPlacesObject.length,
        itemBuilder: (context, index) {
          String name = OtherPlacesObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.orange),
              ),
              leading: Icon(
                Icons.pin_drop_outlined,
                color: Colors.orange,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Other(
                      place: OtherPlacesObject[index],
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

class Other extends StatelessWidget {
  final Map<String, dynamic> place;

  Other({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Name: ${place['name']}',
                style: TextStyle(fontSize: 18, color: Colors.orange),
              ),
            ),
            SizedBox(height: 8.0),
        
        
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Text(
                'Timing: ${place['Timing']}',
                style: TextStyle(fontSize: 16, color: Colors.orange),
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
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            ),
        
        
            SizedBox(height: 8.0),
        
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,

              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Text(
                'Location: ${place['Address']}',
                style: TextStyle(fontSize: 16, color: Colors.orange),
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
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            ),
        

          ],
        ),
      ),

    );
  }
}
