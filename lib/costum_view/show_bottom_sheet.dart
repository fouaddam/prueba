
import 'package:flutter/material.dart';
import 'package:prubas_home/firebase_admin/firebase_admine.dart';

import '../classes/product.dart';

class BottomSheetClass  {

  late BuildContext context;

  BottomSheetClass(this.context);
  List<Product>lista=FireBaseAdmin.shopping_cart;

  void ShowButtomSheet()=>showModalBottomSheet(
    context: context,
    builder: (context)=>ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xff764abc),
            child: Text(lista[index].productName),
          ),
          title: Text('Price ${lista[index].currentPrice}'' Euros'),
          subtitle: const Text('Item description'),
          trailing: const Icon(Icons.more_vert),
        );
      },
    ),
  );
}
