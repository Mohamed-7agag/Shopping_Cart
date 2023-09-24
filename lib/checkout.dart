// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
      ),
      body: ListView.builder(
        itemCount: cart.count,
        itemBuilder: (BuildContext context, int i) {
          return Card(
            elevation: 3,
            child: ListTile(
              title: Text(cart.cartitems[i].name),
              subtitle: Text("${cart.cartitems[i].price}"),
              trailing: IconButton(
                onPressed: () {
                  cart.remove(cart.cartitems[i]);
                },
                icon: Icon(
                  Icons.remove_circle,
                  size: 27,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
