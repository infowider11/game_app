
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants/box_shadow.dart';
import '../constants/colors.dart';
import '../constants/sized_box.dart';
import 'CustomTexts.dart';

class DropDwon extends StatefulWidget {
  final String label;
  final Color? labelcolor;
  final Color? buttoncolorColor;
  final double? fontsize;
  final List<dynamic> items;
  final bool islabel;
  final double? dropdownWidth;
  final double? buttonwidth;
  final double? dropdownwidth;
  final double? buttonheight;
  String? selectedValue;
  final Function(dynamic)? onChanged;
  DropDwon({
    Key? key,
    this.label = 'label',
    this.labelcolor = MyColors.bordercolor,
    this.fontsize = 14,
    this.items = const [
      'All',
      'Option 1',
      'Option 2',
      'Option 3',
      'Option 4',
    ],
    this.islabel = true,
    this.selectedValue,
    this.dropdownWidth,
    this.onChanged,
    this.buttoncolorColor= Colors.transparent,
    this.buttonwidth,
    this.buttonheight=50,
    this.dropdownwidth,

  }) : super(key: key);

  @override
  State<DropDwon> createState() => _DropDwonState();
}

class _DropDwonState extends State<DropDwon> {
  // final List<String> items = [
  //   'All',
  //   'Option 1',
  //   'Option 2',
  //   'Option 3',
  //   'Option 4',
  // ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // vSizedBox2,
            if(widget.islabel)
            // ParagraphText(
            //   text: widget.label,
            //   fontSize: widget.fontsize,
            //   color: widget.labelcolor,
            // ),
            SizedBox(height: 7),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  widget.items[0],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.w500
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                items: widget.items
                    .map((item) => DropdownMenuItem<dynamic>(
                  value: item,
                  child:
                  // item,
                Text(
                  item,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Regular',

                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                ))
                    .toList(),
                value: widget.selectedValue,
                onChanged:widget.onChanged,
                icon: const Icon(
                  Icons.expand_more_outlined,
                ),
                iconSize:22,
                iconEnabledColor: MyColors.primaryColor,
                iconDisabledColor: Colors.grey,
                buttonHeight:widget.buttonheight,
                buttonWidth:widget.buttonwidth?? MediaQuery.of(context).size.width,
                buttonPadding: const EdgeInsets.only(left:18, right:10),
                buttonDecoration: BoxDecoration(
                  boxShadow: [shadow],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: MyColors.primaryColor,width: 0.5
                  ),
                  // color: MyColors.primaryColor,
                  color:widget.buttoncolorColor,

                  // color: Colors.transparent,
                ),
                buttonElevation: 0,
                itemHeight: 30,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: widget.buttonwidth,
                dropdownPadding:null,
                dropdownDecoration: BoxDecoration(
                  boxShadow: [shadow],
                  borderRadius: BorderRadius.circular(5),
                  color:MyColors.blackColor,
                  border: Border.all(
                    color: MyColors.primaryColor,
                  ),

                ),
                dropdownElevation: 0,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
