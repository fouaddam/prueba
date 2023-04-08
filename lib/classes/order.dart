

import 'package:prubas_home/classes/product.dart';
import 'package:prubas_home/classes/user.dart';

class Order {

  late User user;
  late Product product;
  late DateTime now;
  late int quantity;

  Order(this.user,this.product,this.quantity){
    now=DateTime.now();
  }



}