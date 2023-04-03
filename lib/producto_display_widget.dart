


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/firebase_admine.dart';
import 'package:prubas_home/product.dart';

import 'colors_personalizados.dart';

class ProductoDisplayWidget extends StatelessWidget{
  const ProductoDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MasonryGridView.count(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        crossAxisSpacing: 15,
        crossAxisCount: 2,
        itemCount: FireBaseAdmin.productList.length,
        mainAxisSpacing: 10,
        itemBuilder: (context,index){
          return singleItemWiget(
              FireBaseAdmin.productList[index],
              index==FireBaseAdmin.productList.length -1? true:false,
          );
        },

    );

  }

  Widget singleItemWiget(Product productList, bool bool) {

    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: kWihte,
                boxShadow: const [
                  BoxShadow(
                    color: kBackgournd,
                    blurRadius: 5,spreadRadius: 1,
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
                    productList.productUrl,
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
                      productList.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    children: [
                      Text("\€${productList.currentPrice}"),
                      const SizedBox(width: 10,),
                      Text("\€${productList.oldPrice}",
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
            Positioned(
                right: 5,
                top: 10,
                child: Container(
                 height: 30,
                 width: 30,
                  decoration: const BoxDecoration(
                    color: kBackgournd,
                    shape: BoxShape.circle
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    productList.isLiked==true?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,
                    size: 15,
                      color: kWihte
                    ,
                  ),
                ),
            ),

          ],
        ),
      ],
    );

  }



}