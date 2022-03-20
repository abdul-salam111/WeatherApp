import 'package:flutter/material.dart';

const tempstyle = TextStyle(fontSize: 70, color: Colors.white);
const locstyle = TextStyle(fontSize: 70, color: Colors.orange);
const messagetxtstyle = TextStyle(fontSize: 40, color: Colors.white);
const citystyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const cardstyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
const cardheader =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
const cardicon = TextStyle(fontSize: 30);
var inputdecorationn = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    size: 30,
    color: Colors.white,
  ),
  prefixIcon: Icon(Icons.search),
  hintText: 'enter city name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
);
