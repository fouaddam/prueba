
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prubas_home/colors_personalizados.dart';
import 'package:prubas_home/producto_display_widget.dart';
import 'package:prubas_home/text_style.dart';
import 'package:prubas_home/top_container.dart';

class ProductDisplayScreen extends StatefulWidget{
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen>
    with SingleTickerProviderStateMixin {

  late TabController tabController;
  int selectedValue=0;
  int currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 2, vsync: this,initialIndex: 0);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
         child: Column(
            children:  [
              const TopContainer(title: "Productos ", searchBar: "Search Product"),
              TabBar(
                controller: tabController,
                  indicatorColor: Colors.orange,
                  labelColor: CupertinoColors.activeOrange,
                  unselectedLabelColor: kGreyColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  onTap: (value){
                    setState(() {
                      selectedValue=value;
                      tabController.animateTo(value);
                    });
                  },
                  tabs: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        color: selectedValue==1?
                        kBackgournd:kRedColor,
                        boxShadow: selectedValue==0
                            ? [ const BoxShadow(
                            color: kBackgournd,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 1)
                        )
                        ]:null,
                      ),
                      child:  Text("Text1",style: kTextStyle.copyWith(fontSize: 20,color: kWihte),),
                    ),

                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedValue==0?
                        kBackgournd:kRedColor,
                        boxShadow: selectedValue==1
                        ? [ const BoxShadow(
                                color: kBackgournd,
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: Offset(0, 1)
                              )
                        ]:null,
                      ),
                      child:  Text("Text2",style: kTextStyle.copyWith(fontSize: 20,color: kWihte),
                      ),
                    ),
                  ],

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [
                    ProductoDisplayWidget(),
                    ProductoDisplayWidget()

                  ],

                ),
              )
                             ],
        ),
      ),
    );
  }
}