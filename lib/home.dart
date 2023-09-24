// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_state_management/checkout.dart';
import 'package:flutter_state_management/item.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> itemlist = [
    Item(name: "S20", price: 500),
    Item(name: "S23", price: 550),
    Item(name: "P30 pro", price: 200),
    Item(name: "Iphone 13", price: 380),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckOut(),
                    ));
                  },
                  icon: Icon(Icons.shopping_cart)),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text(
                        "${cart.count}",
                        style: TextStyle(fontSize: 18),
                      );
                    },
                  )),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: itemlist.length,
        itemBuilder: (BuildContext context, int i) {
          return Consumer<Cart>(
            builder: (context, cart, child) {
              return Card(
                elevation: 3,
                child: ListTile(
                  title: Text(itemlist[i].name),
                  subtitle: Text("${itemlist[i].price}"),
                  trailing: IconButton(
                      onPressed: () {
                        cart.add(itemlist[i]);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        size: 28,
                        color: Colors.blue,
                      )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
