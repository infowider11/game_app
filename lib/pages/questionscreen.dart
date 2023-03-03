import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/global_data.dart';
import 'package:gameapp/constants/global_keys.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/pages/matchingscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/round_edged_button.dart';

import '../modals/game_user_modal.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import 'new_animation_screen.dart';

class QuestionScreen extends StatefulWidget {
  final QuestionType questionType;
  final List<GameUserModal> users;
  final int selectedUserIndex;
  const QuestionScreen({Key? key, required this.questionType, required this.selectedUserIndex,required this.users,}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: get_drawer(context, scaffoldKey),
      key: scaffoldKey,
      appBar: appbar1(onTap: () {
        scaffoldKey.currentState?.openDrawer();
      }),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(MyImages.bglogo))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.alarm,
            //       color: Colors.white,
            //     ),
            //     hSizedBox05,
            //     ParagraphText(
            //       '0:59',
            //       color: Colors.white,
            //       fontSize: 20,
            //     )
            //   ],
            // ),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ValueListenableBuilder(
                valueListenable: questionData,
                builder: (context, questionDataValue, child) {
                  return RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff888888)),
                          children: [
                            TextSpan(
                              text:
                          '${questionDataValue?['${widget.questionType.name}']['title'].toString().replaceAll('{X}', '${widget.users[widget.selectedUserIndex].userName}').replaceAll('{Y}', '${widget.users[(widget.selectedUserIndex+1)%widget.users.length].userName}')}',
                                  // ' have you even been to a AAA shop? Would you like to go to one with ',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff888888)),
                            )
                          ]));
                }
              ),
            ),
            vSizedBox2,
            // RoundEdgedButton(text: 'Start the game',fontSize: 20,borderRadius:10,color:MyColors.primaryColor,textColor: MyColors.whiteColor,onTap: (){push(context: context, screen: NewAnimationScreen());},),
            RoundEdgedButton(
              text: 'Next Dare',
              width: 176,
              height: 52,
              borderRadius: 8,
              color: MyColors.primaryColor,
              fontSize: 20,
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(MyGlobalKeys.navigatorKey.currentContext!);
                // pushReplacement(context: context, screen: MatchingScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
