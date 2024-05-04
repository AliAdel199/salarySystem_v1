import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBTN extends StatefulWidget {
  CustomBTN(
      {super.key,
      required this.onPressed,
      required this.icon,

      required this.btnTitle});

  VoidCallback onPressed;
 IconData icon;
  String btnTitle;

  @override
  State<CustomBTN> createState() => _CustomBTNState();
}

class _CustomBTNState extends State<CustomBTN> {
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                  color:  const Color(0xff263238),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 1),
                child: IconButton(
                    color: Colors.white,
                    onPressed: widget.onPressed,
                    icon:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.btnTitle,
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              color: Color(0xFFffffff),
                            )),
                        Icon(widget.icon),
                      ],
                    )),
              ),
            );
  }
}
