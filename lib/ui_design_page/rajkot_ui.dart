import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourist_app_new/pages/Dams_and_laks_page.dart';
import 'package:tourist_app_new/pages/about_rajkot.dart';
import 'package:tourist_app_new/pages/amusement_park.dart';
import 'package:tourist_app_new/pages/cinemas_page.dart';
import 'package:tourist_app_new/pages/developer_page.dart';
import 'package:tourist_app_new/pages/devotional_places.dart';
import 'package:tourist_app_new/pages/distance_page.dart';
import 'package:tourist_app_new/pages/historical_places.dart';
import 'package:tourist_app_new/pages/malls_page.dart';
import 'package:tourist_app_new/pages/other_places.dart';
import 'package:tourist_app_new/pages/places_to_see_around.dart';
import 'package:tourist_app_new/pages/rajkot_in_map.dart';
import 'package:tourist_app_new/pages/travel_guide_page.dart';

import '../pages/hotel_page.dart';
import '../pages/how_to_reach.dart';

class RajkotTouristGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rajkot Tourist Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TouristGuideScreen(),
    );
  }
}

class TouristGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // Background color for better visibility
          child: Center(
            child: Text(
              'RAJKOT TOURIST GUIDE',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        children: [
          GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutRajkotPage(),
                    ));

              },
              child: _buildGridItem(
                  Icons.location_city, 'ABOUT RAJKOT', Colors.red)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => How_To_reach(),
                    ));
              },
              child: _buildGridItem(
                  Icons.directions_bus, 'HOW TO REACH', Colors.green)),
          GestureDetector(
              onTap: () {



              },
              child: _buildGridItem(
                  Icons.map, 'RAJKOT IN MAP', Colors.lightGreen)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoricalPlacesScreen(),
                    ));
              },
              child: _buildGridItem(
                  Icons.plagiarism_sharp, 'HISTORICAL PLACES', Colors.blue)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevotionalPlaces(),
                    ));
              },
              child: _buildGridItem(
                  Icons.fireplace_sharp, 'DEVOTIONAL PLACES', Colors.purple)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Amusement_Park(),
                    ));
              },
              child: _buildGridItem(
                  Icons.park_sharp, 'AMUSEMENT PARKS', Colors.amber)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DamasAndLakesScreen(),
                    ));
              },
              child:
                  _buildGridItem(Icons.water_sharp, 'DAMS/LAKE', Colors.pink)),
          GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtherPlacesPage(),
                    ));

              },
              child:
                  _buildGridItem(Icons.museum, 'OTHER PLACES', Colors.orange)),
          GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacesToSeeAroundage(),
                    ));

              },
              child: _buildGridItem(
                  Icons.location_on, 'PLACES TO SEE AROUND', Colors.teal)),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CinemasPage()));
              },
              child:
                  _buildGridItem(Icons.local_movies, 'CINEMAS', Colors.indigo)),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelPage()));
              },
              child: _buildGridItem(Icons.hotel, 'HOTELS', Colors.deepPurple)),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MallsPage()));
              },
              child: _buildGridItem(
                  Icons.store_mall_directory_sharp, 'MALLS', Colors.brown)),
          GestureDetector(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TravelGuideScreen()));

              },
              child: _buildGridItem(
                  Icons.travel_explore, 'TRAVEL GUIDE', Colors.red)),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DistancePage()));
              },
              child: _buildGridItem(
                  Icons.social_distance_sharp, 'DISTANCES', Colors.lightBlue)),
          GestureDetector(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Developer_page()));

              },
              child: _buildGridItem(
                  Icons.developer_mode, 'DEVELOPER', Colors.blueGrey)),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String text, Color color) {
    return Container(
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

