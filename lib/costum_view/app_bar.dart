import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBar_view extends StatefulWidget {
  const AppBar_view({Key? key}) : super(key: key);

  @override
  State<AppBar_view> createState() => _AppBar_viewState();
}

class _AppBar_viewState extends State<AppBar_view> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Product List'),
      actions: [
        Badge(
          badgeContent: Consumer<CartProvider>(
            builder: (context, value, child) {
              return Text(
                value.getCounter().toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
          ),
          position: const EdgeInsets.symmetric(start: 30, bottom: 30),
          child: IconButton(
            onPressed: () {

            },
            icon: const Icon(FontAwesomeIcons.addressBook),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
