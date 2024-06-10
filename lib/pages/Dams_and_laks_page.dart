import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DamasAndLakesScreen extends StatefulWidget {
  @override
  _DamasAndLakesScreenState createState() => _DamasAndLakesScreenState();
}

class _DamasAndLakesScreenState extends State<DamasAndLakesScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> DamsAndLaksObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
    await _firestore.collection('Dams And Lakes').get();

    setState(() {
      DamsAndLaksObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        backgroundColor: Colors.pink,
        title: Text('Dams And Laks',style: TextStyle(
          color: Colors.white
        ),),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: DamsAndLaksObject.length,
        itemBuilder: (context, index) {
          String name = DamsAndLaksObject[index]['name'];

          return Container(
            color: index % 2 == 0 ? Colors.white : Colors.white60,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(color: Colors.pink),
              ),
              leading: Icon(
                Icons.pin_drop_outlined,
                color: Colors.pink,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.pink,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DamsPage(
                      place: DamsAndLaksObject[index],
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

class DamsPage extends StatelessWidget {
  final Map<String, dynamic> place;

  DamsPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(place['name'] ,style: TextStyle(
          color: Colors.white
        ),),

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
            child: Text(
              'Name: ${place['name']}',
              style: TextStyle(fontSize: 18, color: Colors.pink),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade200,
            child: Text(
              'Location: ${place['Location']}',
              style: TextStyle(fontSize: 16, color: Colors.pink),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Text(
              'Contact: ${place['Contact']}',
              style: TextStyle(fontSize: 16, color: Colors.pink),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade200,
            child: Text(
              'Timing: ${place['Timing']}',
              style: TextStyle(fontSize: 16, color: Colors.pink),
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),

    );
  }
}
