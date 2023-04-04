

import 'package:flutter/material.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/widget/image_list_view.dart';
import 'package:prubas_home/styles/text_style.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

import 'List_Product_View.dart';
import 'splash.dart';

class IntroScreen extends StatefulWidget{
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  //hay que moverlo a button style
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  //-----------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kBackgournd,
      body: Stack(
        alignment: Alignment.center,
        children: [

          Positioned(top: -10, left: -150,
            child: Row(
              children:
              const [
                ImageListView(statrtIndex: 0),
                ImageListView(statrtIndex: 1),
                ImageListView(statrtIndex: 2),
                ImageListView(statrtIndex: 3)
              ],
            ),
          ),

          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height * 0.11,
            child:Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("Vrizze",
                  textAlign: TextAlign.center,
                  style: kTitleStyle.copyWith(
                      color: kRedColor,
                      fontSize: 60,
                      shadows:[
                        Shadow(
                          color: Colors.blue.shade900.withOpacity(0.8),
                          offset: const Offset(7, 3),
                          blurRadius: 8,
                        ),
                      ] ),
              ),

            )


          ),

          Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.8,

                decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      kTransparent,
                      kTransparent,
                      kWihte60,
                      kWihte,
                      kWihte
                    ],
                    begin: Alignment.topCenter,
                    end:Alignment.center
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const SizedBox(height: 100,),
                    const Text("text-text \n text-text-text",
                    style: kTextStyle,
                        textAlign: TextAlign.center),

                    const SizedBox(height: 30,),

                    const Text("text-text \n text-text-text",
                        style: kSubTextStyle,
                        textAlign: TextAlign.center),

                    const SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.only(left: 150.0,right: 150.0),
                      child: SwipeButton.expand(
                        thumb: const Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.white,
                        ),
                        activeThumbColor: kBackgournd,
                        activeTrackColor: Colors.grey.shade300,
                        onSwipe: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Splash()),
                          );
                        },
                        child: const Text(
                          "           Sing In",
                          style: TextStyle(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    )
        ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
