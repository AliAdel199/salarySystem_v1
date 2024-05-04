import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      this.btnColor,
      required this.btnTitle});

  VoidCallback onPressed;
  Color? btnColor;
  String btnTitle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: widget.btnColor ?? Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
            child: Text(
          widget.btnTitle,
          style: const TextStyle(fontFamily: 'Tajawal', color: Colors.white),
        )),
      ),
    );
  }
}
