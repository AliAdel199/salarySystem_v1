import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SummaryUpdates extends StatelessWidget {
  SummaryUpdates({super.key, required this.amount,required this.title});

  String amount;
  String title;
    @override
  Widget build(BuildContext context) {
    return Expanded(flex: 1,
      child: Container(margin: EdgeInsets.all(30),
        decoration: const BoxDecoration(
            color: Color(0xff283342),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
           boxShadow: [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(1, 5), // Shadow position
        ),
      ],
        ),
        width: 200,
        height: 100,
        child: Row(textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1,
              child: CircleAvatar(backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.attach_money_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Expanded(flex: 2,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                        fontFamily: "Tajawal-Light", color: Colors.white, fontSize: 16),
                  ),
                   Text(
                    title,
                    style: const TextStyle(
                        fontFamily: "Tajawal-Light",fontStyle: FontStyle.normal, color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
