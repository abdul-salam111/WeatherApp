import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);
  Future GetData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      AlertDialog(
        title: Text('Sorry !!!'),
        content: Text('You are not connected to internet'),
      );
    }
  }
}
