import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class AboutRajkotPage extends StatefulWidget {
  @override
  _AboutRajkotPageState createState() => _AboutRajkotPageState();
}

class _AboutRajkotPageState extends State<AboutRajkotPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> AboutObject = [];

  @override
  void initState() {
    super.initState();
    _fetchHistoricalPlaces();
  }

  Future<void> _fetchHistoricalPlaces() async {
    QuerySnapshot snapshot =
        await _firestore.collection('Historical Places').get();

    setState(() {
      AboutObject = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: Text(
          'About Rajkotu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: AnotherCarousel(
                images: const [
                  AssetImage("assets/images/dam1.jpg"),
                  AssetImage("assets/images/dam3.jpg"),
                  AssetImage("assets/images/other.jpg"),
                  AssetImage("assets/images/Gondal.jpg"),
                  AssetImage("assets/images/around1.jpg"),
                  AssetImage("assets/images/other1.jpg"),
                  AssetImage("assets/images/tower.jpg"),
                ],
                dotSize: 6,
                indicatorBgPadding: 5.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'About Rajkot',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: Text(
                'Climate and Clothing',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Weather of Rajkot City',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: Text(
                'Culture of Rajkot City',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Nearest Tourism Office',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
