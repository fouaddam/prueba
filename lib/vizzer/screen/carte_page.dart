import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prubas_home/classes/product.dart';
import 'package:prubas_home/firebase_admin/firebase_admine.dart';
import 'package:prubas_home/styles/colors_personalizados.dart';

import '../../costum_view/cart_item_simples.dart';



class CartePage extends StatefulWidget {
  const CartePage({super.key});

  @override
  _CartePageState createState() => _CartePageState();
}

class _CartePageState extends State<CartePage> {

  int _cartBadgeAmount = FireBaseAdmin.shopping_cart.length;
  late bool _showCartBadge;
  Color color = Colors.red;

  List<Product> _listProductShopping = FireBaseAdmin.shopping_cart;

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kGreyColor,
        appBar: AppBar(
          backgroundColor: kBackgournd,
          leading: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          title: const Text('My Shopping Cart'),
          actions: <Widget>[
            _shoppingCartBadge(),
          ],
          bottom: _tabBar(),
        ),
        body: Column(
          children:  <Widget>[
            //_addRemoveCartButtons(),
            const SizedBox(height: 20,),
            CarteItemSimple(),
          ],
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(
         disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
         curve: Curves.easeInCubic,
      ),
      showBadge: _showCartBadge,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: kRedColor,
      ),
      badgeContent: Text(
        _cartBadgeAmount.toString(),//firebaseAdmin colleccion carrito
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: const Icon(FontAwesomeIcons.cartShopping), onPressed: () {}),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.black26,
          ),
          position: badges.BadgePosition.topEnd(top: -14),
          badgeContent:  Text(
            _cartBadgeAmount.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Text("tu carrito")
        ),
      ),
      Tab(
        child: badges.Badge(
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.square,
            borderRadius: BorderRadius.circular(5),
            padding: const EdgeInsets.all(2),
            badgeGradient: const badges.BadgeGradient.linear(
              colors: [
                Colors.purple,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          position: badges.BadgePosition.topEnd(top: -12, end: -20),
          badgeContent: const Text(
            '-20%',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: const Text(
            'finaliza tu compra',
            style: TextStyle(color: kWihte),
          ),
        ),
      ),
    ]);
  }


  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () => setState(() {
                _cartBadgeAmount++;


              }),
              icon: const Icon(Icons.add),
              label: const Text('Add to cart')),
          ElevatedButton.icon(
              onPressed: _showCartBadge
                  ? () => setState(() {




              })
                  : null,
              icon: Icon(Icons.remove),
              label: Text('Remove from cart')),
        ],
      ),
    );
  }
}