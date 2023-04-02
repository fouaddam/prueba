

import 'package:flutter/material.dart';
import 'package:prubas_home/List_Product_View.dart';
import 'package:prubas_home/colors_personalizados.dart';
import 'package:prubas_home/image_list_view.dart';
import 'package:prubas_home/text_style.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //hay que moverlo a button style
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                .height * 0.06,
            child: const Text("title---",
                textAlign: TextAlign.center,
                style: kTitleStyle),
          ),

          Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.75,

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
                    const Text("text-text \n text-text-text",
                    style: kTextStyle,
                        textAlign: TextAlign.center),

                    const SizedBox(height: 30,),

                    const Text("text-text \n text-text-text",
                        style: kSubTextStyle,
                        textAlign: TextAlign.center),

                    const SizedBox(height: 30,),

                    TextButton(
                    style: flatButtonStyle,
                    onPressed: () {//poner en las constatntes de routas
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListProductView()),
                      );
                    },
                    child: const Text('Sing In'),
                  ),
        ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
