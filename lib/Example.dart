import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'styles/colors_personalizados.dart';
import 'firebase_admin/firebase_admine.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double spaceBetween = 10.0;
  final _duration = Duration(milliseconds: 200);


  _onStartScroll(ScrollMetrics metrics) {
    // if you need to do something at the start
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    // do your magic here to change the value
    if(spaceBetween == 30.0) return;
    spaceBetween = 30.0;
    setState((){});
  }
  _onEndScroll(ScrollMetrics metrics) {
    // do your magic here to return the value to normal
    spaceBetween = 10.0;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
      if (scrollNotification is ScrollStartNotification) {
        _onStartScroll(scrollNotification.metrics);
      } else if (scrollNotification is ScrollUpdateNotification) {
        _onUpdateScroll(scrollNotification.metrics);
      } else if (scrollNotification is ScrollEndNotification) {
        _onEndScroll(scrollNotification.metrics);
      }
      return true; // see docs
    },
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: FireBaseAdmin.productListW.length,//hay que crear una lista de categorias
      itemBuilder: (context,index){
        return Container(
          width: MediaQuery.of(context).size.width*0.80,
          height: 170,
          margin: const EdgeInsets.only(
              bottom: 10.0,left: 10.0,right: 10.0
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(FireBaseAdmin.productListW[index].productUrl)
                  ,fit: BoxFit.cover),

          ),



          child: Stack(

            children: [

              Positioned(

                left: 10,
                bottom: 10,
                child: Column(

                  children: [
                    AnimatedContainer(duration: _duration, height: spaceBetween),
                    Text(FireBaseAdmin.productListW[index].productName,
                      style:  const TextStyle(color: kWihte,fontSize: 18,fontWeight:FontWeight.bold),
                    ),
                    AnimatedContainer(duration: _duration, height: spaceBetween),
                    Text("${FireBaseAdmin.productListW.length} Products"),//hay que hacer un grupby de cada categoria

                  ],
                ),

              ),
              AnimatedContainer(duration: _duration, height: spaceBetween),
            ],
          ),

        );
      },

    ),

    );
  }
}