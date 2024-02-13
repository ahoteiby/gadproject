import 'package:gadproject/utilities/constant.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  var myusername, mypassword, error;
  SignIn()  {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
    }
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
              body: ListView(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: formstate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Center(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                        width: 220,
                                      ))),
                              SizedBox(height: 30),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 50),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextFormField(
                                        onSaved: (val) {
                                          myusername = val;
                                        },
                                        validator: (val) {
                                          print(val);
                                          print(val.toString());
                                          if (val != 'admin' && val != 'ahram') {
                                            error = 'اسم المستخدم خطأ';
                                            return error;
                                          }
                                        },
                                        cursorColor: kDarkBuleColor,
                                        style: const TextStyle(
                                            fontSize: 18, color: kDarkBuleColor),
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: kDarkBuleColor,
                                          ),
                                          hintText: 'أسم المستخدم',
                                          hintStyle: TextStyle(
                                              fontSize: 15.0, color: kDarkBuleColor),
                                          fillColor: kDarkBuleColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    TextFormField(
                                      onSaved: (val) {
                                        mypassword = val;
                                      },
                                      validator: (val) {
                                        if (val != 'ahram1876' ) {
                                          error = 'كلمة المرور خطأ';
                                          return error;
                                          //      return LocaleKeys.max_error.tr();
                                        }

                                      },
                                      cursorColor: kDarkBuleColor,
                                      style: const TextStyle(
                                          fontSize: 18, color: kDarkBuleColor),
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        fillColor: kDarkBuleColor,
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: kDarkBuleColor,
                                        ),
                                        hintText: 'كلمة المرور',
                                        hintStyle: TextStyle(
                                          fontSize: 15.0,
                                          color: kDarkBuleColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50),

                                    Container(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 20.0),
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await SignIn();
                                          if (myusername == "admin") {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                "homepage");
                                          }
                                          if (myusername == "ahram") {
                                            Navigator.of(context)
                                                .pushReplacementNamed("HomePage");
                                            // "clienthomepage");
                                          }
                                        },
                                        // -------------------------------------
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
                                                //               kGreenColor,
                                                //         kBuleColor,
                                              ]),
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'دخول',
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


                            ],
                          ),
                        ),
                      ]),

                ],
              ));


  }
}



