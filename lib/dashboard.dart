import 'package:flutter/material.dart';
import 'main.dart';

class TheDashBoard extends StatefulWidget{

  @override
  State<TheDashBoard> createState() => TheDashBoardState();
}

class TheDashBoardState extends State<TheDashBoard>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}