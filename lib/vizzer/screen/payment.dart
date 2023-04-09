import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prubas_home/classes/product.dart';
import 'package:prubas_home/firebase_admin/firebase_admine.dart';

import '../../classes/order.dart';
import '../../styles/colors_personalizados.dart';
import '../../styles/text_style.dart';

class Payment extends StatefulWidget {

   final Stream<List<Order>> stream;
   const Payment({Key? key, required this.stream}) : super(key: key);


  @override
  State<Payment> createState() => _CarteItemSimpleState();
}

class _CarteItemSimpleState extends State<Payment> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;



  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  List<Order>listProduct=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listProduct=FireBaseAdmin.order_list;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Stack(
          children: [
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: listProduct.length,//hay que crear una lista de categorias
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width*0.60,
                  height: MediaQuery.of(context).size.height*0.08,
                  margin: const EdgeInsets.only(
                      bottom: 10.0,left: 10.0,right: 10.0
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        kBackgournd,
                        kGreyColor,
                        kWihte
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
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

                      SizedBox(
                        width: MediaQuery.of(context).size.width/3.5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,top: 10,bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(listProduct[index].product.productName,
                                  style: kTextStyle.copyWith(fontSize: 17)
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,top: 1,bottom: 15,right: 8),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: kBackgournd,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 6,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 20,),
                                    Text("${listProduct[index].quantity} U",style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    ),
                                    Text("*${"${listProduct[index].product.currentPrice} Euros"}",style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    ),

                                    /* IconButton(onPressed: _onPressed, icon: AnimatedIcon(
                                      icon: AnimatedIcons.view_list,
                                      progress: _animationController,
                                      color: Colors.black,
                                      size: 44,
                                    ),
                                    ),*/
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
