import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utilities/constant.dart';

class SendMsg extends StatefulWidget {

  final Uri phoneNumber = Uri.parse('tel:+201202220159');
  final Uri whatsapp = Uri.parse('https://wa.me/201202220159');
  @override
  State<SendMsg> createState() => _SendMsgState();
}

class _SendMsgState extends State<SendMsg> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  var phone ;
  var message = ' ';
  var error;
  var val2;
  var txt1 = TextEditingController();
  var itemName = TextEditingController();

  sendWhatsAppMessage ()async {

    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
    }
    // String url() {
      // if (Platform.isIOS) {

        // return 'https//wa.me/$phone?text=${Uri.parse(message)}';
   // String url = 'https//wa.me/201202220159?text=bbnnnkkkkk';
  //  String url = 'https://api.whatsapp.com/send?phone=+201202220159&text=i want to test it';
    String url = 'https://api.whatsapp.com/send?phone=${phone}&text=${Uri.parse(message)}';

    //   }
    //   else {
    //     print('888888888888');
    //     return 'https//send?phone=$phone&text=$message';
    //   }
    //  }
    // print('sssssss');
    // print(url);
    // print('------>>>>>>>>>');
    // print('aaaaaaa${Uri.parse(url)}');
    // print('opopopopopopo');
    // print(canLaunchUrl(Uri.parse(url)));
     await launchUrl(Uri.parse(url));
     // print(launchUrl(Uri.parse(url)));

    //  await canLaunchUrl(url() as Uri) ? launchUrl(url() as Uri) : print('dddddd');
    //  await canLaunch(url()) ? launch(url()) : print('gggggggg');
  }
  @override



  void initState(){
     // phone = ' ';
     // message = ' ';
 //   sendWhatsAppMessage(phone, message);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('تعديل صنف n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),),
        backgroundColor: Colors.blue,
      ),
        body: Form(
          key: formstate,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
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
                      phone = val2;
                    });
                  },
                  cursorColor: kDarkBuleColor,
                  style: const TextStyle(
                      fontSize: 18, color: kDarkBuleColor),
                  // textAlign: TextAlign.right,
                  // textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "رقم الموبيل",
                    labelStyle: TextStyle(
                      fontSize: 30.0,
                      color: kDarkBuleColor,
                    ),
                    fillColor: kDarkBuleColor,
                  ),
                ),
                TextFormField(
                  controller: itemName,
                  onSaved: (val) {
                    setState(() {
                      message = val!;
                    });
                    //        mypassword = val;
                  },
                  cursorColor: kDarkBuleColor,
                  style: const TextStyle(
                      fontSize: 18, color: kDarkBuleColor),
                  decoration: const InputDecoration(
                    // alignLabelWithHint: true,
                    labelText: "الرسالة ",
                    labelStyle: TextStyle(
                      fontSize: 30.0,
                      color: kDarkBuleColor,
                    ),
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()  {
                      sendWhatsAppMessage();
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
                        child: const Text('ارسال',
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
        )
    );
  }
}
