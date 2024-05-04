import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeButton extends StatelessWidget {
  HomeButton(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onPressed});
  String title;
  Image iconPath;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
        var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(25),
        width: width*0.13,
        height: width*0.13,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(106, 79, 77, 77),
                blurRadius: 15,
                offset: Offset(1, 3), // Shadow position
              ),
            ],
            color: Color(0xff283342),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // CircleAvatar(
          //   backgroundColor: const Color(0xff019AA4),
          //   child: iconPath,
          //   radius: 35,
          // ),
          SizedBox(height: width*0.07,width: width*0.07, child: iconPath),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Tajawal-Light",fontSize: 18, color: Colors.white),
          )
        ]),
      ),
    );
  }
}
