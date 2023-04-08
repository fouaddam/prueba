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

class _CarteItemSimpleState extends State<CarteItemSimple> with SingleTickerProviderStateMixin{

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

  int _cartAmount=1;
  List<Product>listProduct=[];

  get onPressed => null;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listProduct=FireBaseAdmin.shopping_cart;

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
                  width: MediaQuery.of(context).size.width*0.80,
                  height: MediaQuery.of(context).size.height*0.14,
                  margin: const EdgeInsets.only(
                      bottom: 10.0,left: 10.0,right: 10.0
                  ),
                   decoration: BoxDecoration(
                     gradient:const LinearGradient(
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
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width/4,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            color: kBackgournd,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                          ],
                        ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(imageUrl : listProduct[index].productUrl,fit: BoxFit.cover,),
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
                                style: kTextStyle.copyWith(fontSize: 17)
                              ),
                              Text("${listProduct[index].currentPrice} Euros",
                                style: kTextStyle.copyWith(color: kBackgournd

                                    ,fontSize: 15),)

                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,top: 1,bottom: 15,right: 8),
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
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: kBackgournd,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 6,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon:  const Icon(FontAwesomeIcons.plus,size: 20,color: kWihte,),
                                      onPressed: () {
                                        setState(() {
                                          print("---------------------------$index");
                                          _cartAmount++;
                                        });
                                      },
                                    ),
                                    Text(_cartAmount.toString(),style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white
                                    ),
                                    ),
                                    IconButton(
                                      icon:  const Icon(FontAwesomeIcons.minus,size: 20,color: kWihte,),
                                      onPressed: () {
                                        setState(() {
                                          print("---------------------------$index");
                                          _cartAmount--;
                                        });
                                      },
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
