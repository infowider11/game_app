import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/pages/matchingscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/round_edged_button.dart';

import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: get_drawer(context,),
      key: scaffoldKey,
      appBar: appbar1('John Smith',(){scaffoldKey.currentState?.openDrawer();}),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              MyImages.bglogo
            )
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alarm,color: Colors.white,),
                hSizedBox05,
                ParagraphText('0:59',color: Colors.white,fontSize:20,)
              ],
            ),
            vSizedBox2,
            RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
              text: 'John ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Color(0xff888888)),
              children: [
                TextSpan(
                  text: ' have you even been to a AAA shop? Would you like to go to one with ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color:Colors.white),
                ),
                TextSpan(
                  text: ' Rubby',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color:Color(0xff888888)),
                )
              ]
            )),
            vSizedBox2,
            RoundEdgedButton(text: 'Next Dare',width: 176,height:52,borderRadius: 8,color: MyColors.primaryColor,fontSize: 20,onTap: (){pushReplacement(context: context, screen: MatchingScreen());},)
          ],
        ),
      ),
    );
  }
}
