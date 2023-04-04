

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/firebase_admin/firebase_admine.dart';
import 'package:prubas_home/costum_view/top_container.dart';

class ListCategoryView extends StatefulWidget{
  const ListCategoryView({super.key});

  @override
  State<ListCategoryView> createState() => _ListCategoryViewState();
}

class _ListCategoryViewState extends State<ListCategoryView> {


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
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: FireBaseAdmin.categoryList.length,//hay que crear una lista de categorias
                itemBuilder: (context,index){
                  return Container(
                    width: MediaQuery.of(context).size.width*0.80,
                    height: 170,
                    margin: const EdgeInsets.only(
                      bottom: 10.0,left: 10.0,right: 10.0
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(FireBaseAdmin.categoryList[index].urlImage)
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
                              const SizedBox(height: 10),
                              Text("${FireBaseAdmin.categoryList[index].productoCount} Products"),//hay que hacer un grupby de cada categoria

                            ],
                          ),
                        ),

                      ],
                    ),

                  );


                },
                ),
          ],

        ),
      )
    );
  }
}