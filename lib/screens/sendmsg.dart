import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SendMsg extends StatefulWidget {

  final Uri phoneNumber = Uri.parse('tel:+201202220159');
  final Uri whatsapp = Uri.parse('https://wa.me/201202220159');
  @override
  State<SendMsg> createState() => _SendMsgState();
}

class _SendMsgState extends State<SendMsg> {
  var phone = ' ';
  var message = ' ';
  sendWhatsAppMessage (String phone,  String message )async {
    print('hhhhh');
    // String url() {
      // if (Platform.isIOS) {
        print('fffffff');
        // return 'https//wa.me/$phone?text=${Uri.parse(message)}';
   // String url = 'https//wa.me/201202220159?text=bbnnnkkkkk';
    String url = 'https://api.whatsapp.com/send?phone=+201202220159&text=i want to test it';

    //   }
    //   else {
    //     print('888888888888');
    //     return 'https//send?phone=$phone&text=$message';
    //   }
    //  }
    print('sssssss');
    print(url);
    print('------>>>>>>>>>');
    print('aaaaaaa${Uri.parse(url)}');
    print('opopopopopopo');
    print(canLaunchUrl(Uri.parse(url)));
     await launchUrl(Uri.parse(url));
     print(launchUrl(Uri.parse(url)));

    //  await canLaunchUrl(url() as Uri) ? launchUrl(url() as Uri) : print('dddddd');
    //  await canLaunch(url()) ? launch(url()) : print('gggggggg');
  }
  @override



  void initState(){
     phone = '201202220159';
     message = 'helllloooo';
    sendWhatsAppMessage(phone, message);
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
            Text('send msg')
          ],
        )
    );
  }
}
