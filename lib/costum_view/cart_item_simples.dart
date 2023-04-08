import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/styles/text_style.dart';
import '../classes/product.dart';
import '../firebase_admin/firebase_admine.dart';


StreamController<int> streamController=StreamController<int>.broadcast();

class CarteItemSimple extends StatefulWidget {
  const CarteItemSimple({Key? key}) : super(key: key);



  @override
  State<CarteItemSimple> createState() => _CarteItemSimpleState();
}

class _CarteItemSimpleState extends State<CarteItemSimple> {

  int _cartAmount=1;
  List<Product>listProduct=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listProduct=FireBaseAdmin.shopping_cart;

  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listProduct.length,//hay que crear una lista de categorias
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  height: MediaQuery.of(context).size.height*0.12,
                  margin: const EdgeInsets.only(
                      bottom: 10.0,left: 10.0,right: 10.0
                  ),
                   decoration: BoxDecoration(
                     color:kBackgournd,
                     borderRadius: BorderRadius.circular(10),
              ),

                  child: Row(
                    children: [
                      /*Radio(
                        value:"",
                        groupValue: "",
                        activeColor :kRedColor,
                        onChanged: (String? value) {
                        },

                      ),*/
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width/4,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            color: kWihte,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: CachedNetworkImage(imageUrl: listProduct[index].productUrl,
                          height: 70,
                          width: 70,
                        ),

                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width/3.5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,top: 10,bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listProduct[index].productName,
                                style: const TextStyle(
                                  color: kRedColor,
                                  fontSize: 20
                                ),
                              ),
                              Text("${listProduct[index].currentPrice} Euros",
                                style: kTextStyle.copyWith(color: kWihte,fontSize: 15),)

                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width/3.5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18,top: 1,bottom: 15),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          IconButton(
                          icon:  const Icon(Icons.delete,size: 25,color: kRedColor,),
                          onPressed: () {
                            setState(() {
                              listProduct.removeAt(index);
                              //CartePage(items: listProduct.length,stream:streamController.stream ,);
                              streamController.add(listProduct.length);
                              //  streamController.stream.asBroadcastStream().listen(listProduct.length);
                            }
                            );
                          },
                        ),
                              Container(
                                child: 
                                Row(
                                  children: [
                                    Text("data"),
                                    Text("data")
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                      

                    ],
                  ),

                );


              },
            ),

          ],
        ),

      ),
    );

  }
}
