// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_state_management/checkout.dart';
import 'package:flutter_state_management/home.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
