import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';

import '../constants/sized_box.dart';
import 'CustomTexts.dart';
class MonthlyPlanCard extends StatelessWidget {
  final Map index;
  final void Function(bool?)? checkboxCallBack;
  final bool isChecked ;

  const MonthlyPlanCard({Key? key,required this.isChecked,this.checkboxCallBack,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal:10,vertical: 20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.primaryColor)),
      child:
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:20,
                child:  Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side:BorderSide(color: Colors.white),
                  activeColor: Colors.lightBlueAccent,
                  fillColor: MaterialStateProperty.all<Color>((MyColors.primaryColor)),
                  value:index['isChecked'],
                  onChanged:checkboxCallBack,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParagraphText('${index['title']}',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16,),
                    vSizedBox,
                    ParagraphText('${index['subtitle']}',color: Colors.white,),


                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
