import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownSimple extends StatefulWidget {
  


  List<String>? items;
  final Function? onChanged;
final double width;
  
  final String? title;
final String? selectedValue;
  CustomDropdownSimple({super.key,required this.items,required this.title,required this.selectedValue,required this.onChanged,required this.width});

  _CustomDropdownSimpleState createState() => _CustomDropdownSimpleState();
}

class _CustomDropdownSimpleState extends State<CustomDropdownSimple> {
  String dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
          padding: EdgeInsets.only(right: 12,top: 8),
          child: Text(widget.title!, style: TextStyle(fontFamily: 'Tajawal',color: Colors.black87 ,),),
        ),
         DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: widget.items!
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: widget.selectedValue,
                            onChanged: (value) {
                             widget.onChanged!(value);
                            },
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black87, width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 37,
                              width: widget.width,
                            ),
                            dropdownStyleData: const DropdownStyleData(
                              maxHeight: 300,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 25,
                            ),
                          
                         
                          ),
                        ),
      ],
    );
  }
}

