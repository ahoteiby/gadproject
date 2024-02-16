import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:gadproject/utilities/constant.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  var itemName = TextEditingController();
  var itemAmount = TextEditingController();
  var itemPrice = TextEditingController();
  var val2;
  var error;
  var txt1 = TextEditingController();
  bool isshow = false;
  int itemId = 10;





checkData() async {

  var formdata = formstate.currentState;
  if (formdata!.validate()) {
    formdata.save();
  }




    itemId = val2;

    var url = "http://10.211.55.3:5168/api/ProductsTbls/";
    url = url + itemId.toString();

    var response = await http.get(Uri.parse(url));
  print(response.statusCode);
  if (response.statusCode == 200) {
    var responsebody = jsonDecode(response.body);
    setState(()  {
      itemName.text = responsebody['productName'].toString();
      itemAmount.text = responsebody['productAmount'].toString();
      itemPrice.text = responsebody['productPrice'].toString();
      isshow = !isshow;
    });
    print('200');
  } else { if (response.statusCode == 404) {
    setState(()  {
      itemName.clear;
      itemAmount.clear() ;
      itemPrice.clear();
      isshow = !isshow;
    });

    print('404');
  }

  }



}




addItem() async{
  // var itname = itemName.text;
  // int itid = itemId;
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
      var response = await http.post(
          Uri.parse("http://10.211.55.3:5168/api/ProductsTbls",),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
          },
          body: body);
      print(' another end');
    } catch (e) {
      print(e);
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('اضافه او تعديل صنف',
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (val) {
                        if (val == null) {
                          error = 'يجب ادخال ارقام فقط';
                          return error;
                        }
                      },
                onSaved: (val) {
                  val2 =  int.parse(val!);
                 setState(() {
                     itemId = val2;
                 });
                },
                        cursorColor: kDarkBuleColor,
                        style: const TextStyle(
                        fontSize: 18, color: kDarkBuleColor),
                      // textAlign: TextAlign.right,
                      // textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                          labelText: "ادخل كود الصنف",
                        labelStyle: TextStyle(
                          fontSize: 30.0,
                          color: kDarkBuleColor,
                        ),
                        fillColor: kDarkBuleColor,
                        ),
                        ),
                    SizedBox(height: 50,),
                    Visibility(
                      visible: isshow,
                      child: Column(
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
                                addItem();
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
                                  child: const Text('بgggحث',
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
                    Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()  {
                           checkData();
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
                            child: const Text('بحث',
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
