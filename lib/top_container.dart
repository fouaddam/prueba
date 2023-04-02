
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/colors_personalizados.dart';
import 'package:prubas_home/text_style.dart';

class TopContainer extends StatelessWidget{

  final String title;
  final String searchBar;
  const TopContainer({super.key, required this.title, required this.searchBar});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            Text(title,
            style: kTextStyle
              ,),

            const Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,

              ),
              child: Stack(
                children: [
                  Icon(FontAwesomeIcons.bell,color:kBackgournd,size: 20,),
                  Positioned(
                    right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:Colors.limeAccent
                        ),

                     ),
                  ),
                          ],
              ),

            ),
          ],

        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child:  Row(
            children: [
               const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ),
              Text(searchBar,style: const TextStyle(color: kBackgournd),)

            ],
          ),

        ),
      ],


    );
  }




}