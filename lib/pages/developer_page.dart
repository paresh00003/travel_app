import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Developer_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blueGrey,


        title: Text('Developer',style: TextStyle(
          color: Colors.white
        ),),

        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),

      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(


            width: MediaQuery.of(context).size.width,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Develop By Paresh Chauhan',
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                  speed: Duration(milliseconds: 150),
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {

              },
            ),
          ),
        ),
      ),
    );
  }
}
