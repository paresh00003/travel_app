import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class How_To_reach extends StatefulWidget {
  @override
  _How_To_reachState createState() => _How_To_reachState();
}

class _How_To_reachState extends State<How_To_reach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'How To Reach',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BY ROAD",
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                  Icon(
                    Icons.car_crash_outlined,
                    color: Colors.green,
                    size: 24,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Rajkot is well connected to the major cities and towns by state transport and private buses.',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BY RAIL",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  Icon(
                    Icons.directions_railway_filled_sharp,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Rajkot is well connected to the major cities and towns by state transport and private buses.',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BY AIR",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  Icon(
                    Icons.airplanemode_active_sharp,
                    color: Colors.green,

                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Rajkot is well connected to the major cities and towns by state transport and private buses.',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
