import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/styles/text_style.dart';

import '../firebase_admin/firebase_admine.dart';

class CarteItemSimple extends StatefulWidget {
  const CarteItemSimple({Key? key}) : super(key: key);

  @override
  State<CarteItemSimple> createState() => _CarteItemSimpleState();
}

class _CarteItemSimpleState extends State<CarteItemSimple> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: FireBaseAdmin.shopping_cart.length,//hay que crear una lista de categorias
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  height: 100,
                  margin: const EdgeInsets.only(
                      bottom: 10.0,left: 10.0,right: 10.0
                  ),
                   decoration: BoxDecoration(
                     color: kBackgournd,
                     borderRadius: BorderRadius.circular(10)
              ),

                  child: Row(
                    children: [
                      Radio(
                        value:"",
                        groupValue: "",
                        activeColor :kRedColor,
                        onChanged: (String? value) {
                        },

                      ),
                      Container(
                        height: 70,
                        width: 80,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: kWihte,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: CachedNetworkImage(imageUrl: FireBaseAdmin.shopping_cart[index].productUrl,
                          fit: BoxFit.cover,
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FireBaseAdmin.shopping_cart[index].productName,
                              style: const TextStyle(
                                color: kRedColor,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text("${FireBaseAdmin.shopping_cart[index].currentPrice} Euros",
                              style: kTextStyle.copyWith(color: kWihte,fontSize: 15),)

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                          Icon( Icons.delete_outlined,
                          color: kWihte,),
                          ],
                        ),
                      )

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
