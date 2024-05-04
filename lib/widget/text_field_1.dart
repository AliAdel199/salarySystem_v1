import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextField1 extends StatefulWidget {
  final String? hint;
  final String? fieldTitle;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? titleColor;
  final Color? borderColor;
  final Color? errorColor;
  final TextInputType? inputType;
  final bool? obscureText;
  final Function? validator;
  bool? isNespa = false;
  bool? isreadOnly = false;
  int? nespa;

  final Function? onChanged;

  TextField1(
      {super.key,
      required this.hint,
      required this.fieldTitle,
      this.controller,
      this.isreadOnly,
      this.onChanged,
      this.isNespa,
      this.baseColor,
      this.borderColor,
      this.errorColor,
      this.titleColor,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.nespa,
      
      this.validator});

  @override
  _TextField1State createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor!;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 3, top: 5),
          child: Text(
           widget.isNespa! ? "${widget.fieldTitle!} ${widget.nespa}%":widget.fieldTitle!,
            style: TextStyle(
              fontFamily: 'Tajawal',
              color: widget.titleColor ?? Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 45,
          child: Card(
            elevation: 0.0,
                      color:widget.controller!.text.length>1?Colors.blue[50]: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: currentColor, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Tooltip(message: widget.isreadOnly! ? "mmm":"",
                child: TextField(
                  readOnly: widget.isreadOnly!,
                  obscureText: widget.obscureText!,
                  onChanged: (text) {
                    widget.onChanged!(text);
                  },
                            
                  //keyboardType: widget.inputType,
                  controller: widget.controller,
                  decoration: InputDecoration(
                   
                    hintStyle: TextStyle(
                      color: widget.baseColor,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w300,
                    ),
                    border: InputBorder.none,
                    hintText: widget.hint,
                  ),
                ),
              ),
            ),

          ),
         
        ),
        
      ],
    );
  }
}
