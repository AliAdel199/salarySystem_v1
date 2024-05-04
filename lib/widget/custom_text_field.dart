import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
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
  bool? isdate = false;
  bool? isreadOnly = false;

  final Function? onChanged;

  CustomTextField(
      {super.key,
      required this.hint,
      required this.fieldTitle,
      this.controller,
      this.isreadOnly,
      this.onChanged,
      this.isdate,
      this.baseColor,
      this.borderColor,
      this.errorColor,
      this.titleColor,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      
      this.validator});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 3, top: 5),
          child: Text(
            widget.fieldTitle!,
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
            color:Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: currentColor, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: TextField(
                readOnly: widget.isreadOnly!,
                obscureText: widget.obscureText!,
                onChanged: (text) {
                  widget.onChanged!(text);
                },

                //keyboardType: widget.inputType,
                controller: widget.controller,
                decoration: InputDecoration(
                  icon: widget.isdate!
                      ? GestureDetector(
                          onTap: () async {
                            final d = await showDatePicker(
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.dark(
                                        primary: Colors
                                            .white, // header background color
                                        onPrimary:
                                            Colors.black, // header text color
                                        onSurface:
                                            Colors.white, // body text color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              Colors.white, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                initialDatePickerMode: DatePickerMode.day,
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            if (d != null) {
                              widget.controller!.text =
                                  DateFormat('yyyy/MM/dd').format(d);
                            }
                          },
                          child: Icon(Icons.calendar_month))
                      : const SizedBox(),
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
      ],
    );
  }
}
