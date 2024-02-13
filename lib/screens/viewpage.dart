import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gadproject/screens/updatepage.dart';
import 'package:http/http.dart' as http;
import '../widgets/itemcard.dart';
import '../widgets/loader.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override

  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  List allData = [];
  var src = ' ';

  getData() async {
 //   http://10.211.55.3:5168/api/ProductsTbls/101

    var url = "http://10.211.55.3:5168/api/ProductsTbls";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      allData.addAll(responsebody);
    });
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  Widget build(BuildContext  context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text('قائمه الاصناف',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),),
          backgroundColor: Colors.blue,
        ),
        body: allData.isEmpty || allData == null ? Loader() :

        ListView.builder(
            itemCount: allData.length,
            itemBuilder: (context, i)  {
              src =    allData[i]['productName'];
              // categoryId = categorylist[i]['categoryno'];
              String url =   'https://4.img-dpreview.com/files/p/E~C667x0S5333x4000T1200x900~articles/3925134721/0266554465.jpeg';
              return GestureDetector(
                child: Container(
                  child: ItemCard(
                    itemId: allData[i]['id'],
                    itemName: allData[i]['productName'],
                    itemAmount: allData[i]['productAmount'],
                    itemPrice: allData[i]['productPrice'].toString(),
                  ),
                ),
                onTap: () {
                  print('-------------->');
                  print(allData[i]['id']);
                  print('-------------->');
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context) =>  UpdatePage(allData[i]['id'] ))
                  );
                },
              );
              // Text("no : ${categorylist[i]['categoryno']}");
            }
        )
      //
    );   // return  Scaffold(
  }
}
