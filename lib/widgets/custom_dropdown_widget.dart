


import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/widgets/CustomTexts.dart';

class CustomDropdownWidget extends StatelessWidget {
  final double height;
  final String hintText;
  final Color borderColor;
  final ValueNotifier selectedItem;
  final List<dynamic> items;
  final String keyValue;

  final ValueNotifier<bool> showDropDown = ValueNotifier(false);
   CustomDropdownWidget({
    Key? key,
    this.height=52,
    required this.selectedItem,
    this.hintText = 'hint text',
    this.borderColor = MyColors.primaryColor,
     this.items = const [],
     this.keyValue = 'title',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showDropDown,
      builder: (context, showDropDownValue, child) {
        return Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                showDropDown.value = !showDropDown.value;
              },
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyColors.primaryColor, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: selectedItem,
                          builder: (context, value, child) {
                            return Text(
                              value==null?hintText:value!['$keyValue'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Regular',

                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          }
                        ),
                      ),
                      Icon(
                        Icons.expand_more_outlined,
                        color: borderColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if(showDropDownValue)
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor??MyColors.primaryColor, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int i = 0;i<items.length;i++)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: ()async{
                            selectedItem.value = items[i];
                            print('the value is ${selectedItem.value}');
                            showDropDown.value = false;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: ParagraphText(items[i]['$keyValue'], color: Colors.white,),
                          ),
                        )
                    ],
                  ),
                ),
              )

          ],
        );
      }
    );
  }
}




// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// import '../constants/box_shadow.dart';
// import '../constants/colors.dart';
// import '../constants/sized_box.dart';
// import 'CustomTexts.dart';
//
// class DropDown<T> extends StatefulWidget {
//   final String label;
//   final Color? labelcolor;
//   final Color? buttoncolorColor;
//   final double? fontsize;
//   final List<T> items;
//   final bool islabel;
//   final double? dropdownWidth;
//   final double? buttonwidth;
//   final double? dropdownwidth;
//   final double? buttonheight;
//   final String hintText;
//   String? selectedValue;
//   final Function(dynamic)? onChanged;
//   DropDown({
//     Key? key,
//     this.label = 'label',
//     this.labelcolor = MyColors.bordercolor,
//     this.fontsize = 14,
//     required this.items,
//     this.islabel = true,
//     this.selectedValue,
//     this.dropdownWidth,
//     this.onChanged,
//     this.buttoncolorColor= Colors.transparent,
//     this.buttonwidth,
//     this.buttonheight=50,
//     this.dropdownwidth,
//     this.hintText = '',
//
//   }) : super(key: key);
//
//   @override
//   State<DropDown> createState() => _DropDownState();
// }
//
// class _DropDownState extends State<DropDown> {
//   // final List<String> items = [
//   //   'All',
//   //   'Option 1',
//   //   'Option 2',
//   //   'Option 3',
//   //   'Option 4',
//   // ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // vSizedBox2,
//             if(widget.islabel)
//             // ParagraphText(
//             //   text: widget.label,
//             //   fontSize: widget.fontsize,
//             //   color: widget.labelcolor,
//             // ),
//               SizedBox(height: 7),
//             DropdownButtonHideUnderline(
//               child: DropdownButton2(
//                 isExpanded: true,
//                 hint: Text(
//                   widget.hintText,
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                       fontFamily: 'Regular',
//                       fontWeight: FontWeight.w500
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 items: widget.items
//                     .map((item) => DropdownMenuItem(
//                   value: item,
//                   child:
//                   // item,
//                   Text(
//                     widget.selectedValue??'',
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Regular',
//
//                       // fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ))
//                     .toList(),
//                 value: widget.selectedValue,
//                 onChanged:widget.onChanged,
//                 icon: const Icon(
//                   Icons.expand_more_outlined,
//                 ),
//                 iconSize:22,
//                 iconEnabledColor: MyColors.primaryColor,
//                 iconDisabledColor: Colors.grey,
//                 buttonHeight:widget.buttonheight,
//                 buttonWidth:widget.buttonwidth?? MediaQuery.of(context).size.width,
//                 buttonPadding: const EdgeInsets.only(left:18, right:10),
//                 buttonDecoration: BoxDecoration(
//                   boxShadow: [shadow],
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                       color: MyColors.primaryColor,width: 0.5
//                   ),
//                   // color: MyColors.primaryColor,
//                   color:widget.buttoncolorColor,
//
//                   // color: Colors.transparent,
//                 ),
//                 buttonElevation: 0,
//                 itemHeight: 30,
//                 itemPadding: const EdgeInsets.only(left: 14, right: 14),
//                 dropdownMaxHeight: 200,
//                 dropdownWidth: widget.buttonwidth,
//                 dropdownPadding:null,
//                 dropdownDecoration: BoxDecoration(
//                   boxShadow: [shadow],
//                   borderRadius: BorderRadius.circular(5),
//                   color:MyColors.blackColor,
//                   border: Border.all(
//                     color: MyColors.primaryColor,
//                   ),
//
//                 ),
//                 dropdownElevation: 0,
//                 scrollbarRadius: const Radius.circular(40),
//                 scrollbarThickness: 6,
//                 scrollbarAlwaysShow: true,
//                 offset: const Offset(0, 0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
