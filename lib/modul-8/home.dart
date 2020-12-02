
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Tugas'),
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Internet Programming'),
         Text('Politeknik Elektronika Negeri Surabaya'),
         Image.asset('assets/pens.png'),
       ],
     ),
    );
  }
}