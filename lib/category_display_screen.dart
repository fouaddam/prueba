

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prubas_home/colors_personalizados.dart';
import 'package:prubas_home/firebase_admine.dart';
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
          children:  [
            const TopContainer(title: "Category", searchBar: "serche category"),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: FireBaseAdmin.productList.length,//hay que crear una lista de categorias
                itemBuilder: (context,index){
                  return Container(
                    width: MediaQuery.of(context).size.width*0.80,
                    height: 170,
                    margin: const EdgeInsets.only(
                      bottom: 10.0,left: 10.0,right: 10.0
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(FireBaseAdmin.productList[index].productUrl)
                      ,fit: BoxFit.cover)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                            bottom: 10,
                            child: Column(
                            children: [
                              Text(FireBaseAdmin.productList[index].productName,
                              style:  const TextStyle(color: kWihte,fontSize: 18,fontWeight:FontWeight.bold),
                              ),
                              Text("${FireBaseAdmin.productList.length} Products"),//hay que hacer un grupby de cada categoria

                            ],
                          ),
                        ),
                      ],
                    ),

                  );
                }),
          ],

        ),
      )
    );
  }
}