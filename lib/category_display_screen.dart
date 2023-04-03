

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prubas_home/top_container.dart';

class CategoryDisplayScreen extends StatefulWidget{
  const CategoryDisplayScreen({super.key});

  @override
  State<CategoryDisplayScreen> createState() => _CategoryDisplayScreenState();
}

class _CategoryDisplayScreenState extends State<CategoryDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Column(
          children: const [
            TopContainer(title: "Category", searchBar: "serche category"),
          ],
        ),
      )
    );
  }
}