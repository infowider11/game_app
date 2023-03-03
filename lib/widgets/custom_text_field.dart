
import 'package:flutter/material.dart';


import '../constants/box_shadow.dart';
import '../constants/colors.dart';
import '../constants/global_constants.dart';
import 'CustomTexts.dart';

class CustomTextField extends StatelessWidget {
  final  EdgeInsetsGeometry? contentPadding;
  final TextEditingController controller;
  final double? width;
  final String hintText;
  final Color? textColor;
  final BoxBorder? border;
  final bool horizontalPadding;
  final bool obscureText;
  final int? maxLines;
  final Color bgColor;
  final Color? hintcolor;
  final double verticalPadding;
  final double fontsize;
  final double borderRadius;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? headingText;
  final Function()? onTap;
  final Widget? suffix;
  final Widget? preffix;
  final String? prefixText;
  TextInputType? keyboardType;
  final bool enabled;
  final String? suffixText;
  final bool enableInteractiveSelection;
  final bool textalign;
  final bool? autofocus;
  final FocusNode? focusNode;
  final int? maxLength;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.border,
    this.maxLines,
    this.autofocus=false,
    this.preffix,
    this.horizontalPadding = false,
    this.obscureText = false,
    this.bgColor = MyColors.inputcolor,
    this.hintcolor ,
    this.verticalPadding=0,
    this.fontsize = 15,
    this.borderRadius = 18,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.headingText,
    this.enabled = true,
    this.suffix,
    this.suffixText,
    this.textColor,
    this.prefixText,
  this.focusNode,
  this.enableInteractiveSelection = true,
    this.onTap,
    this.textalign = false,
    this.width,
    this.contentPadding,
    this.maxLength
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:maxLines==null?50:null,
      // width:MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding ? 16 : 0, vertical: 8),
      decoration: BoxDecoration(
          color:headingText!=null?Colors.transparent: bgColor,
          border:headingText!=null?null:border==null?Border.all(color:MyColors.primaryColor,width: 0.5):border,
          // border: border,
          borderRadius: BorderRadius.circular(borderRadius),
          // boxShadow: [shadow],
      ),
      padding:headingText!=null?null: EdgeInsets.symmetric(horizontal: 16, vertical:verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(headingText!=null)
          SubHeadingText( headingText!),
          TextField(
            maxLines: maxLines ?? 1,
            focusNode: focusNode,
            textAlign: textalign? TextAlign.center: TextAlign.left,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLength: maxLength,

            style: TextStyle(color:textColor, fontSize: fontsize,fontFamily: 'Regular'),

            autofocus: autofocus!,
            textAlignVertical: TextAlignVertical.center,
            enableInteractiveSelection: true,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding:contentPadding,
              suffix: suffix,
              counterText: '',
              suffixStyle: TextStyle(
                  fontSize: 16
              ),
              prefixIcon: preffix,
              isDense: true,
              hintText: hintText,
              suffixText: suffixText,
              prefixText: prefixText,
              prefixStyle: TextStyle(
                fontSize: 16
              ),
              hintStyle: TextStyle(
                color:hintcolor,
                // Color(0xffffffff),
                fontSize:15,
                fontFamily: 'Regular'
              ),
              // MyGlobalConstants.textFieldHintTextStyle,
              labelStyle: MyGlobalConstants.textFieldTextStyle,
              border:headingText!=null?null: InputBorder.none,
              errorText: errorText,
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

