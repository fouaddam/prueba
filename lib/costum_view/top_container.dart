
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/styles/text_style.dart';

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
                  const Icon(FontAwesomeIcons.bell,color:kBackgournd,size: 20,),
                  Positioned(
                    right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:Colors.red
                        ),

                     ),
                  ),
                          ],
              ),

            ),
          ],

        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child:  Row(
            children:  [
              const Spacer(),
               const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
              ),
               ),

               SizedBox(
                 width: 180,
                 height: 30,
                 child: TextField(
                 decoration: InputDecoration(
                   border: const OutlineInputBorder(),
                   labelText: searchBar,
                 ),
                ),
               ),

            ],
          ),

        ),
      ],


    );
  }




}