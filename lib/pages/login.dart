import 'package:flutter/material.dart';
import '/widget/custom_button.dart';

import '../widget/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(textDirection: TextDirection.ltr,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset('assets/login.png'),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xff263238),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: CustomTextField(
                        fieldTitle: "اسم المستخدم :",
                        hint: 'userName',
                        obscureText: false,
                        controller: userName,
                        onChanged: (x) {
                          setState(() {
                            print(x);
                          });
                        },
                        baseColor: Colors.black54,
                        borderColor: Colors.black54,
                        errorColor: Colors.red,
                        validator: (x) {
                        
                        }),
                  ),
                     const SizedBox(height: 25,),
                  SizedBox(
                    width: 400,
                    child: CustomTextField(
                      fieldTitle: "كلمة المرور",
                      hint: 'userName',
                      controller: userPassword,
                      onChanged: (x) {
                      
                      },
                      obscureText: true,
                      baseColor: Colors.black54,
                      borderColor: Colors.black54,
                      errorColor: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,textDirection: TextDirection.ltr,
                    children: [
                       SizedBox(
                        width: 150,
                        height: 50,
                        child: CustomButton(
                          onPressed: () {
                            if(userName.text=="علي" && userPassword.text=="1234") {
                                  print("true login");
                            }else{
                              print("false login");
                            }
                          },
                          btnColor: Colors.redAccent,
                          btnTitle: "خروج",
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: CustomButton(
                          onPressed: () {},
                          btnColor: Colors.green,
                          btnTitle: "دخول",
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
