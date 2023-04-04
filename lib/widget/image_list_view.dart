

import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_admin/firebase_admine.dart';

class ImageListView extends StatefulWidget{

  final int statrtIndex;

  const ImageListView({super.key, required this.statrtIndex});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {

  final _scroller=ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scroller.addListener(() {
      if(_scroller.position.atEdge){
            _autoScroller();

      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _autoScroller();
      });
    });
  }

  void _autoScroller(){
    var currentScrollerPosition=_scroller.offset;
    final endScrollerPosition=_scroller.position.maxScrollExtent;
    const duration= Duration(seconds: 10);


    scheduleMicrotask(() {
      _scroller.animateTo(
          currentScrollerPosition==endScrollerPosition?
          0:endScrollerPosition,
          duration: duration, curve: Curves.linear);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.rotate(
        angle: 1.96*pi,
      child: SizedBox(

        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.height*0.8,

          child: ListView.builder(
            controller: _scroller,
            itemCount :5,//hay que dejarlo fijo??
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index){
            return CachedNetworkImage(
               imageUrl: FireBaseAdmin.productList[index].productUrl,
               imageBuilder: (context,imageProvider){
                 return Container(
                   margin: const EdgeInsets.only(
                       right:8.0 ,
                       left:8.0 ,
                       top: 8.0
                   ),
                   height: MediaQuery.of(context).size.height*0.30,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20.0),
                     image: DecorationImage(
                       image: imageProvider,
                       fit: BoxFit.cover,
                     )
                   ),
                 );
               },
            );
          },
          ),
      ),

    );
  }
}