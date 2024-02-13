import 'dart:convert';
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
  var responsebody = jsonDecode(response.body);
    setState(()  {
      itemName.text = responsebody['productName'].toString();
       itemAmount.text = responsebody['productAmount'].toString();
       itemPrice.text = responsebody['productPrice'].toString();
      isshow = !isshow;
    });
}




addItem() async{
print('additem');
  // var httpsUri = Uri(
  //     scheme: 'http//',
  //     host: '10.211.55.3:5168',
  //     path: '/api/ProductsTbls/',
  //     queryParameters: {'ID': '122', 'ProductName': 'asas',  'ProductAmount': '10',  'ProductPrice': '10.5'});
  //     print(httpsUri);

  // var postUrl = "http://10.211.55.3:5168/api/ProductsTbls/";
  // var postresponse = await http.post(Uri.parse(postUrl), body: {
  //   "id": "12",
  //   "productName": "iiddname",
  //   "productAmount": "55",
  // });
  // var postresponsebody = jsonDecode(postresponse.body);
  // print(postresponsebody);
  // return postresponsebody;

  // -------------------------------------------------------- //
//
// curl -X 'PUT' \
// 'http://10.211.55.3:5168/api/ProductsTbls/190' \
// -H 'accept: */*' \
// -H 'Content-Type: application/json' \
// -d '{
// "id": 190,
//   "productName": "aaaanbbb",
//   "productAmount": 70,
//   "productPrice": 60
// }'
  //
  // -------------------------------------------------------- //
  var itname = 'adel';
  int itid = 2290;
  int itamount = 250;
  var itprice = 55.55;
    try {
      print('try');
      // Map data1 = {
      //
      //           "id": itid,
      //          "productname": itname,
      //          "productamount": itamount,
      //          "productprice": itprice
      // };
      Map data1 = {
        "id": 230,
        "productName": "bbbbb",
        "productAmount": 90,
        "productPrice": 90.90
      };
      //encode Map to JSON
      var body = json.encode(data1);
      print(body);
      // ----------------------------------------
      var response = await http.post(
          Uri.parse("http://10.211.55.3:5168/api/ProductsTbls",),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
          },
          body: body);

      // --------------------------------------
      // var response = await http.post(
      //     Uri.parse("http://10.211.55.3:5168/api/ProductsTbls",),
      //      headers: <String, String>{
      //        'content-type': 'application/json',
      //        body: body,
      //      }
      //        );
      // ----------------------------------------
      //            Delete Working
      // ----------------------------------------

      // var response = await http.delete(
      //     Uri.parse(
      //       "http://10.211.55.3:5168/api/ProductsTbls/102",
      //     ));
      //


// ----------------------------------------
//       curl -X 'PUT' \
//       'http://10.211.55.3:5168/api/ProductsTbls/190' \
//       -H 'accept: */*' \
//       -H 'Content-Type: application/json' \
//       -d '{
//       "id": 190,
//   "productName": "aaaanbbb",
//   "productAmount": 70,
//   "productPrice": 60
//   }'
      // -----------------------------------------
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (BuildContext context) => const DisplayUsers()),
      //         (Route<dynamic> route) => false);
       print(response.statusCode);
      print(response.request);
      print(response.headersSplitValues);
      print(response.reasonPhrase);

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

                              // fillColor: kDarkBuleColor,
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
