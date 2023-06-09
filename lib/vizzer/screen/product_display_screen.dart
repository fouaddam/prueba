
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';
import 'package:prubas_home/widget/producto_display_widget.dart';
import 'package:prubas_home/styles/text_style.dart';
import 'package:prubas_home/costum_view/top_container.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
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
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        color: kRedColor,
                        boxShadow: selectedValue==0
                            ? [ const BoxShadow(
                            color: kBackgournd,
                            blurRadius: 7,
                            spreadRadius: 4,
                            offset: Offset(0, 1)
                        )
                        ]:null,
                      ),
                      child:  Text("Mujer",style: kTextStyle.copyWith(fontSize: 18,color: kWihte),),
                    ),

                    Container(
                      width: double.infinity,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kBackgournd,
                        boxShadow: selectedValue==1
                        ? [ const BoxShadow(
                                color: kBackgournd,
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: Offset(0, 1)
                              )
                        ]:null,
                      ),
                      child:  Text("Hombre",style: kTextStyle.copyWith(fontSize: 18,color: kWihte),
                      ),
                    ),
                  ],

              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [
                    ProductoDisplayWidget(gender:true),
                    ProductoDisplayWidget(gender:false),


                  ],

                ),
              )
                             ],
        ),
      ),
    );
  }
}