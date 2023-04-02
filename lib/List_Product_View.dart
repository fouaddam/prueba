
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/category_display_screen.dart';
import 'package:prubas_home/colors_personalizados.dart';
import 'package:prubas_home/product_display_screen.dart';

class ListProductView extends StatefulWidget{
  const ListProductView({super.key});

  @override
  State<ListProductView> createState() => _ListProductViewState();
}

class _ListProductViewState extends State<ListProductView> {

  int currentIndex=0;
  final pageControiller=PageController(initialPage: 0);

  //iconos
  final tabBarIconos=[
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageControiller,
              onPageChanged: (index){
                setState(() {
                  currentIndex=index;
                });
              },

              children: const [
                ProductDisplayScreen(),
                CategoryDisplayScreen()
              ],
            ),
            
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: kBackgournd,
                    borderRadius: BorderRadius.circular(40.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...tabBarIconos.map((icono) => IconButton(onPressed: (){
                        icono==FontAwesomeIcons.house?
                            pageControiller.jumpTo(0):
                            pageControiller.jumpTo(1);

                      }, icon: Icon(icono,color: kWihte,size: 22,)
                      )
                      ),

                    ],
                  ),
              
            ),
            )
          ],
          
          

        ),




      ),
    );
  }
}