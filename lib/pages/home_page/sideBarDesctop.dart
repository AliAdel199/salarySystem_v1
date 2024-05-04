import 'package:flutter/material.dart';

class SideBarDesctop extends StatefulWidget {
  const SideBarDesctop({super.key});

  @override
  State<SideBarDesctop> createState() => _SideBarDesctopState();
}

class _SideBarDesctopState extends State<SideBarDesctop> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Expanded(
        flex: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xff1D242E),
              title:
                  Row(crossAxisAlignment: CrossAxisAlignment.end,textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "اورنج للرواتب",
                  style: TextStyle(fontFamily: "Tajawal", color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/logo.png', fit: BoxFit.cover)
              ])),
          body: Container(
            color: const Color(0xff263238),
            height: height,
            width: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    child: Row(textDirection: TextDirection.ltr,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.white,
                                    size: 25,
                                  )),
                            )),
                        const Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "علي عادل",
                                  style: TextStyle(
                                      fontFamily: 'Tajawal-Light',
                                      color: Colors.white),
                                ),
                                Text(
                                  "مبرمج",
                                  style: TextStyle(
                                      fontFamily: 'Tajawal-Light',
                                      color: Color(0xffFED600)),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/budget.png')))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
