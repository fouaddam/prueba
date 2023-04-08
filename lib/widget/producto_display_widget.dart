
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/firebase_admin/firebase_admine.dart';
import 'package:prubas_home/classes/product.dart';
import 'package:prubas_home/styles/text_style.dart';
import '../classes/order.dart';
import '../classes/user.dart';
import '../styles/colors_personalizados.dart';
import '../vizzer/home.dart';

class ProductoDisplayWidget extends StatefulWidget{

  final bool gender;
  const ProductoDisplayWidget({super.key, required this.gender});



  @override
  State<ProductoDisplayWidget> createState() => _ProductoDisplayWidgetState();
}

class _ProductoDisplayWidgetState extends State<ProductoDisplayWidget> {

  List<Product>list_shopping=FireBaseAdmin.shopping_cart;
  List<Order>list_oder=FireBaseAdmin.order_list;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


    // se peude costumizar pasandole com paramtro de entrada una lista
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MasonryGridView.count(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        crossAxisSpacing: 6,
        crossAxisCount: 2,
        itemCount: widget.gender?FireBaseAdmin.productListW.length:FireBaseAdmin.productListM.length,
        mainAxisSpacing: 5,
        itemBuilder: (context,index){
          return singleItemWiget(
              widget.gender?FireBaseAdmin.productListW[index]:FireBaseAdmin.productListM[index],
              index==FireBaseAdmin.productListW.length -1? true:false,//hay que corrigerlo normalmente aqui ponemos el lenght total
              context,

          );
        },

    );

  }

  Widget singleItemWiget(Product product, bool lastItem,BuildContext context) {

    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  color: widget.gender?kRedColor:kBackgournd,
                  boxShadow: const [
                    BoxShadow(
                      color: kBackgournd,
                      blurRadius: 7,spreadRadius: 6,
                      offset: Offset(1, 1)
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(imageUrl:
                      product.productUrl,
                      fit: BoxFit.cover,
                      ),
                    ),
                     Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 10.0,
                        ),
                      child: Text(
                        product.productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:widget.gender? kTitleStyle.copyWith(fontSize: 15,color: kBackgournd):kTitleStyle.copyWith(fontSize: 15,color: kWihte),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      children: [
                        Text("\€${product.currentPrice}",
                        style: const TextStyle(
                            color: kGreyColor),),

                        const SizedBox(width: 10,),
                        Text("\€${product.oldPrice}",
                        style: const TextStyle(
                          color: kGreyColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: kRedColor,
                          decorationThickness: 2

                        ),
                        ),
                      ],

                    ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 10,
                top: 10,
                child: Container(
                 height: 30,
                 width: 30,
                  decoration: const BoxDecoration(
                    color: kBackgournd,
                    shape: BoxShape.circle
                  ),
                  alignment: Alignment.center,
                  child:/* Icon(
                    productList.isLiked==true?
                    FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,
                    size: 15,
                      color: kRedColor,
                  ),*/
                  IconButton(
                      onPressed: () {
                        setState(() {

                          if(list_shopping.contains(product)){ //añadir a favoritos
                            list_shopping.remove(product);
                          }else{
                            list_shopping.add(product);
                          }
                        });
                        },

                      icon:  Icon(iconChech(product),
                        size: 15,
                        color: kRedColor,)
                  ),
                ),
            ),

            Positioned(
              right: 10,
              bottom: 20,
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    color: kWihte,
                    shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: IconButton(
                    onPressed: () {
                      setState(() {

                        list_oder.add(Order(User("fouad"), product,1));

                      });
                    },

                    icon:  const Icon(FontAwesomeIcons.cartShopping,
                      size: 15,
                      color: kRedColor,)
                ),
              ),
            ),

          ],
        ),
        SizedBox(
          height:
            lastItem==true ?MediaQuery.of(context).size.height*0.50:0,
        ),
      ],
    );

  }

  IconData? iconChech(Product product) {

    if(list_shopping.contains(product)){
    }
   late IconData j =FontAwesomeIcons.heart;

    if(list_shopping.contains(product)){
      j= FontAwesomeIcons.solidHeart;
    }
      return j;
    }
  }
