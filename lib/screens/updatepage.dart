import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdatePage extends StatefulWidget {
  var id;
  UpdatePage(this.id);
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  var itemId ;
  var itemName;
  var itemAmount;
  var itemPrice;


  getItem() async {
    var url = "http://10.211.55.3:5168/api/ProductsTbls/" + widget.id.toString();
    print(url);
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print(responsebody['id']);
    setState(() {
      itemId = responsebody['id'];
      itemName = responsebody['productName'];
      itemAmount = responsebody['productAmount'];
      itemPrice = responsebody['productPrice'];

      print('000000000000000');
      print(itemId);
      print(itemName);
      print(itemAmount);
      print(itemPrice);
    });
  }

  @override
  void initState(){
    getItem();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('تعديل صنف',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text('hiiiii'),
      Text('hiiiii'),
      ],
      ),

    );
  }
}
