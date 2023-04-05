
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/vizzer/screen/category_display_screen.dart';
import 'package:prubas_home/vizzer/screen/product_display_screen.dart';


class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex=0;//screens
  int currentIndexBar=0;//bar
  Color colorICon=kRedColor;

  final pageControiller=PageController(initialPage: 0);

  //iconos
  final tabBarIconos=[
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];

  final tabBarIconosPressed=[
    FontAwesomeIcons.airbnb,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kGreyColor,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
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
                  height: 40,
                  decoration: BoxDecoration(
                    color: kBackgournd,
                    borderRadius: BorderRadius.circular(40.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...tabBarIconos.map((icono) => IconButton(onPressed: (){
                        icono==FontAwesomeIcons.house?
                        colorICon=Colors.limeAccent:
                        icono=tabBarIconosPressed.first;


                      },
                          icon: Icon(icono,color: kWihte,size: 22,)
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