import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:gadproject/screens/homepage.dart';
import 'package:gadproject/screens/viewpage.dart';
import 'package:gadproject/utilities/constant.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
 // const UpdatePage({super.key});
  var id;
  UpdatePage(this.id);
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();


  var itemName = TextEditingController();
  var itemIID = TextEditingController();
  var itemAmount = TextEditingController();
  var itemPrice = TextEditingController();
  var val2;
  var error;
  var txt1 = TextEditingController();
  bool isshow = false;
  int itemId = 10;


  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('رسالة تأكيد'),
          content: const Text('هل تريد الالغاء'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                DeleteItem();
                // Handle the confirm action
              },
            ),
          ],
        );
      },
    );
  }


  DeleteItem() async {

    // var formdata = formstate.currentState;
    // if (formdata!.validate()) {
    //   formdata.save();
    // }

  //  itemId = val2;

    var url = "http://10.211.55.3:5168/api/ProductsTbls/";
    url = url + widget.id.toString();

    var response = await http.delete(Uri.parse(url));
    print('item deleted');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:(context) =>  HomePage()));
  }

  getItem() async {
    var url = "http://10.211.55.3:5168/api/ProductsTbls/" + widget.id.toString();
    print(url);
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print(responsebody['id']);
    setState(() {
      itemId = responsebody['id'];
      itemIID.text = responsebody['id'].toString();
      itemName.text = responsebody['productName'].toString() ;
      itemAmount.text = responsebody['productAmount'].toString();
      itemPrice.text = responsebody['productPrice'].toString();
    });
  }


  UpdateItem() async{
    int itamount = 555;
    var itprice = 666.6;
    try {
      Map data1 = {
        "id": itemId as int,
        "productName": itemName.text,
        "productAmount": itemAmount.text,
        "productPrice": itemPrice.text
      };
      var body = json.encode(data1);
      var url = "http://10.211.55.3:5168/api/ProductsTbls/" + itemIID.text;
      var response = await http.put(
          Uri.parse(url),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
          },
          body: body);
    } catch (e) {
      print(e);
    }
  }
  void initState(){

    getItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(' تعديل صنف',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),),
        backgroundColor: Colors.blue,
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: ListView(
          children: [
            Padding(
              padding:  const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Form(
                key: formstate,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),

                Row(
                  children: [

                    Text('كود الصنف', style: TextStyle(
                      fontSize: 25, color: kDarkBuleColor)),
                    SizedBox(width: 20,),
                    Text(widget.id.toString(), style: TextStyle(
                        fontSize: 18, color: kDarkBuleColor)),
                  ],
                ),
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      //   controller: itemIID,
                      //
                      //   validator: (val) {
                      //     if (val == null) {
                      //       error = 'يجب ادخال ارقام فقط';
                      //       return error;
                      //     }
                      //   },
                      //   onSaved: (val) {
                      //     val2 =  int.parse(val!);
                      //     setState(() {
                      //       itemId = val2;
                      //     });
                      //   },
                      //   cursorColor: kDarkBuleColor,
                      //   style: const TextStyle(
                      //       fontSize: 18, color: kDarkBuleColor),
                      //
                      //   decoration: const InputDecoration(
                      //     alignLabelWithHint: true,
                      //     labelText: " كود الصنف",
                      //     labelStyle: TextStyle(
                      //       fontSize: 30.0,
                      //       color: kDarkBuleColor,
                      //     ),
                      //     fillColor: kDarkBuleColor,
                      //   ),
                      // ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          TextFormField(
                            controller: itemName,
                            onSaved: (val) {
                              //        mypassword = val;
                            },
                            cursorColor: kDarkBuleColor,
                            style: const TextStyle(
                                fontSize: 18, color: kDarkBuleColor),
                            decoration: const InputDecoration(
                              // alignLabelWithHint: true,
                              labelText: "اسم الصنف",
                              labelStyle: TextStyle(
                                fontSize: 30.0,
                                color: kDarkBuleColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: itemAmount,
                            onSaved: (val) {
                              //        mypassword = val;
                            },
                            cursorColor: kDarkBuleColor,
                            style: const TextStyle(
                                fontSize: 18, color: kDarkBuleColor),
                            decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: "الكمية",
                              labelStyle: TextStyle(
                                fontSize: 30.0,
                                color: kDarkBuleColor,
                              ),
                              fillColor: kDarkBuleColor,
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: itemPrice,
                            onSaved: (val) {
                              //        mypassword = val;
                            },
                            cursorColor: kDarkBuleColor,
                            style: const TextStyle(
                                fontSize: 18, color: kDarkBuleColor),
                            //     obscureText: true,
                            decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: "السعر",
                              labelStyle: TextStyle(
                                fontSize: 30.0,
                                color: kDarkBuleColor,
                              ),

                              fillColor: kDarkBuleColor,
                            ),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: ()  {
                                UpdateItem();
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder:(context) =>  HomePage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(50))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      kBuleColor,
                                      kDarkBuleColor,
                                    ]),
                                    borderRadius:
                                    BorderRadius.circular(30)),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const Text('تعديل',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white
                                      //    fontStyle: FontStyle.italic
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()  {
                            _showAlertDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(50))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  kBuleColor,
                                  kDarkBuleColor,
                                ]),
                                borderRadius:
                                BorderRadius.circular(30)),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text('الغاء',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white
                                  //    fontStyle: FontStyle.italic
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
