import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourist_app_new/ui_design_page/rajkot_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBjWH55hKPFBlct-Ujp-TCO-i5EaE4sJYo",
          appId: "1:26849013123:android:0d92edd51a242c75f45ab6",
          messagingSenderId: "26849013123",
          projectId: "tourist-app-for-module",
          storageBucket: "tourist-app-for-module.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: RajkotTouristGuideApp()
    );
  }
}
