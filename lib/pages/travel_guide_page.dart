import 'package:flutter/material.dart';

import '../model/guide_class.dart';



class TravelGuideScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'BADGUJAR NITIN P',
        city: 'Rajkot',
        phoneNumber: '+918758756140'),
    Contact(
        name: 'BAGDA SHAILESH B.',
        city: 'Rajkot',
        phoneNumber: '+917600139769'),
    Contact(
        name: 'CHUDASAMA IMRAN',
        city: 'Rajkot',
        phoneNumber: '+918735815005'),
    Contact(
        name: 'JOLAPARA HARDIK B.',
        city: 'Rajkot',
        phoneNumber: '+918866733157'),
    Contact(
        name: 'JOSHI SAHIL',
        city: 'Rajkot',
        phoneNumber: '+919825164552'),
    Contact(
        name: 'JOSHI VISHAL BHARATBHAI',
        city: 'Rajkot',
        phoneNumber: '+919978102800'),
    Contact(
        name: 'PITHADIA VIMAL D.',
        city: 'Rajkot',
        phoneNumber: '+919904136563'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(

        backgroundColor: Colors.red,
        title: const Text('TravelGuide',style: TextStyle(
          color: Colors.white
        ),),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: ListView.separated(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: const Icon(Icons.person, color: Colors.red),
            title: Text(contact.name, style: TextStyle(color: Colors.red.shade900)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.city),
                Text(contact.phoneNumber),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios,color: Colors.red,),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.shade400,
            thickness: 1,
          );
        },
      ),


    );
  }
}