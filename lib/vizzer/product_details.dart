import 'dart:core';
import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/classes/product.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/styles/text_style.dart';

import '../classes/order.dart';
import '../classes/user.dart';
import '../firebase_admin/firebase_admine.dart';

class ProductDetails extends StatefulWidget {


    final Product product;
    ProductDetails({Key? key, required this.product}) : super(key: key);
    int numItem=1;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  List<String>categoryName=['category1','category2','category3','category4','category1','category2','category3','category4'];
  int selectedIndex=0;

  List<Product>list_shopping=FireBaseAdmin.shopping_cart;
  List<Order>list_oder=FireBaseAdmin.order_list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      list_oder.forEach((element) {
        if(element.product==widget.product){
          widget.numItem=element.quantity;
        }else{
          widget.numItem=1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children:  [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(widget.product.productName,
              style: kSubTextStyle.copyWith(fontSize: 20),),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 35,
            child: ListView.builder(
                scrollDirection:Axis.horizontal ,
                itemCount: categoryName.length,
                itemBuilder:(context,index)=>buildCategoy(index)),
          ),
          SingleChildScrollView(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height/1.3,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3),
                       padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.12,left:
                       MediaQuery.of(context).size.width*0.07),
                       // height: 500,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              kBackgournd,
                              kGreyColor,
                              kWihte
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Color'),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ColorDot(context,kRedColor,true),
                                          const SizedBox(width: 20,),
                                          ColorDot(context,kBackgournd,false),
                                          const SizedBox(width: 20),
                                          ColorDot(context,kGreyColor,false),
                                          //hay que poner el size dentro del constructor
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                 const Expanded(child: Text("Size : 41 cm")),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted. "),
                            ),
                            Row(
                              children:  [
                                 CartCounter(FontAwesomeIcons.minus, () {
                                   setState(() {
                                     if(widget.numItem>1){
                                       list_oder.forEach((element) {
                                         if(element.product==widget.product){
                                           element.quantity--;
                                           widget.numItem--;

                                         }
                                       });
                                     }
                                   });
                                 }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                   child: Text(widget.numItem.toString()),
                                ),
                                CartCounter(FontAwesomeIcons.plus, () {
                                  setState(() {

                                    list_oder.forEach((element) {
                                      if(element.product==widget.product){
                                        element.quantity++;
                                        widget.numItem++;
                                      }
                                    });

                                  });
                                }
                                ),
                                SizedBox(width: 150,),
                                Container(

                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle
                                      ),
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if(list_shopping.contains(widget.product)){ //añadir a favoritos
                                                list_shopping.remove(widget.product);
                                              }else{
                                                list_shopping.add(widget.product);
                                              }
                                            });
                                          },
                                          icon:   Icon(iconChech(widget.product),
                                            size: 20,
                                            color: kRedColor,)
                                      ),
                                    ),

                                ),
                                 SizedBox(width: 20,),

                                 Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle
                                    ),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {

                                            list_oder.add(Order(User("fouad"), widget.product,1));

                                          });
                                        },

                                        icon:  const Icon(FontAwesomeIcons.cartShopping,
                                          size: 20,
                                          color: kRedColor,)
                                    ),
                                ),

                              ],
                            ),

                          ],
                        ),
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Text(widget.product.productName),
                            Text("Price\n"),
                            Text(widget.product.currentPrice),
                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: kRedColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 10,
                                        blurRadius: 20,
                                        offset: Offset(3, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                    child: CachedNetworkImage(imageUrl : widget.product.productUrl,fit: BoxFit.cover,),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],

            ),
          ),

        ],
      ),
    );
  }

  Widget ColorDot(BuildContext context,Color colorSelected,bool isSelected) {
    Color color;

    return Container(
      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/60),
      padding: const EdgeInsets.all(4),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colorSelected),
      ),
      child:  DecoratedBox(
        decoration: BoxDecoration(color: isSelected?colorSelected:Colors.transparent,shape: BoxShape.circle                                       ),
                                    ),
                                  );
  }

  Widget buildCategoy(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex=index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categoryName[index],
              style: kTextStyle.copyWith(fontSize: 15,
                  color: selectedIndex==index?Colors.black:Colors.grey),
                      ),

            Container(
              margin: const EdgeInsets.only(top: 2),
              height: 2,
              width: 35,
              color: selectedIndex==index?Colors.red:kTransparent,
            ),

          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.white60,Colors.black]),
        ),
      ),
      elevation: 0,
      title: const Text("detalles Producto",style: TextStyle(
        fontFamily: 'Lobster',fontSize: 25
      ),),
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.backward), onPressed: () {
      },
      ),
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.magnifyingGlass), onPressed: () {
        },
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.cartShopping), onPressed: () {
        },
        ),

      ],
    );
  }

  IconData? iconChech(product) {
    if(list_shopping.contains(product)){
    }
    late IconData j =FontAwesomeIcons.heart;

    if(list_shopping.contains(product)){
      j= FontAwesomeIcons.solidHeart;
    }
    return j;
  }
  }


class CartCounter extends StatefulWidget {
  final IconData iconData;
  final Function() onPressed;


  const CartCounter(this.iconData, this.onPressed, {super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
            ),
            onPressed: (){
              widget.onPressed();
            }, child:  Icon(widget.iconData),
          ),
        ),
      ],
    );
  }
}

