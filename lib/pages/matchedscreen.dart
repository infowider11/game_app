import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/pages/questionscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/appbar.dart';
import 'package:gameapp/widgets/drawer.dart';
import 'package:gameapp/widgets/round_edged_button.dart';

import '../functions/navigation_functions.dart';
class MatchedScreen extends StatefulWidget {
  const MatchedScreen({Key? key}) : super(key: key);

  @override
  State<MatchedScreen> createState() => _MatchedScreenState();
}

class _MatchedScreenState extends State<MatchedScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      drawer: get_drawer(context,),

      appBar: appbar1(onTap: (){scaffoldKey.currentState?.openDrawer();}),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyImages.bglogo)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundEdgedButton(text: 'Truth',color: MyColors.primaryColor,width: 176,borderRadius: 8,height: 52,fontSize: 20,verticalMargin: 0,
              onTap: (){push(context: context, screen: QuestionScreen());},
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(MyImages.spinner,height: 400,width: 400,),
                  Image.asset(MyImages.spinner2,height: 295,width: 295,),
                  Image.asset(MyImages.spinner1,height: 213,width: 213,),
                  GestureDetector(
                    onTap: (){
                      // push(context: context, screen: MatchedScreen());
                    },
                    child: Container(
                      height: 105,width: 105,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.primaryColor,
                          border: Border.all(color: Color(0xffCE1C55),width:6)
                      ),
                      child: Center(
                        child: ParagraphText('John',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            RoundEdgedButton(text: 'Dare',color: MyColors.primaryColor,width: 176,borderRadius: 8,height: 52,fontSize: 20,verticalMargin: 0,
              onTap: (){push(context: context, screen: QuestionScreen());},
            ),

          ],
        ),
      ),
    );
  }
}
