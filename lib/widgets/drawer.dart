import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gameapp/constants/box_shadow.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/modals/user_modal.dart';
import 'package:gameapp/pages/changepassword.dart';
import 'package:gameapp/pages/editprofilescreen.dart';
import 'package:gameapp/pages/homemultipleplayerscreen.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/pages/monthlyplan.dart';
import 'package:gameapp/pages/transactionhistory.dart';
import 'package:gameapp/widgets/dropdown.dart';
import 'package:gameapp/widgets/round_edged_button.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/colors.dart';

import '../constants/global_data.dart';
import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';

import '../pages/homescreen.dart';
import '../pages/unlock_screen.dart';
import '../services/local_services.dart';
import '../widgets/CustomTexts.dart';
import 'custom_confirmation_dialog.dart';

Drawer get_drawer(BuildContext context,  GlobalKey<ScaffoldState> scaffoldKey) {
  TextEditingController emailcontroller = TextEditingController();
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ParagraphText(
                      'PROFILE',
                      color: Color(0xff970634),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    ValueListenableBuilder<UserModal?>(
                      valueListenable: userDataNotifier,
                      builder: (context, userData, child) {
                        return ParagraphText(
                          'ID: ${userData!.gameId}',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        );
                      }
                    )
                  ],
                ),
                vSizedBox,
                Row(
                  children: [
                    Icon(
                      (Icons.person),
                      color: Colors.white,
                      size: 20,
                    ),
                    hSizedBox,
                    ValueListenableBuilder(
                      valueListenable: userDataNotifier,
                      builder: (context, userData, child) {
                        return ParagraphText(
                          '${userData!.fullName}',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        );
                      }
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      (Icons.mail),
                      color: Colors.white,
                      size: 20,
                    ),
                    hSizedBox,
                    ValueListenableBuilder(
                        valueListenable: userDataNotifier,
                        builder: (context, userData, child) {
                        return ParagraphText(
                          '${userData!.emailId}',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        );
                      }
                    )
                  ],
                ),
              ],
            ),
          ),
          vSizedBox05,
          Divider(
            thickness: 2,
            color: Color(0xff000000).withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText(
                  'Language',
                  color: Color(0xff970634),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                // DropDwon(
                //   buttoncolorColor: Color(0xffb72654),
                //   items: ['English', 'Germany'],
                //   dropdownWidth: 50,
                // ),
                ValueListenableBuilder(
                  valueListenable: selectedLanguage,
                  builder: (context, selectedLanguageValue, child) {
                    return DropDwon(
                      buttoncolorColor: Color(0xffb72654),
                      items: globalLanguagesList,
                      dropdownWidth: 50,
                      selectedValue: selectedLanguageValue,
                      onChanged: (value){
                        selectedLanguage.value = value;
                        // setState(() {choosenValue = value as String?;});

                      },
                    );
                  }
                ),
              ],
            ),
          ),
          vSizedBox05,
          Divider(
            thickness: 0.8,
            color: Color(0xff000000).withOpacity(0.3),
          ),
          vSizedBox05,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText(
                  'SELECT GAME LEVEL',
                  color: Color(0xff970634),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                vSizedBox2,
               for(int i = 0;i<gameLevels.length;i++)
                 GestureDetector(
                   onTap: () {
                     if(gameLevels[i].isFree){
                       selectedGameLevel.value = gameLevels[i];
                       Navigator.pop(context);
                       // push(context: context, screen: HomeMultiplePlayerScreen());
                     }else{
                       push(context: context, screen: UnlockScreen());
                     }

                   },
                   child: Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Row(
                       children: [
                         Image.network(
                           gameLevels[i].imageUrl,
                           height: 15,
                           width: 15,
                         ),
                         hSizedBox,
                         Expanded(
                           child: ParagraphText(
                             '${gameLevels[i].name}',
                             color: Colors.white,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                         if(gameLevels[i].isFree)
                         Container(
                           padding: EdgeInsets.all(5),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             border: Border.all(color: MyColors.whiteColor, width: 0.3),
                           ),
                           child: ParagraphText('Free', fontSize: 8,color: Colors.white,),
                         )
                       ],
                     ),
                   ),
                 ),
                // vSizedBox2,
                // GestureDetector(
                //   onTap: (){
                //     Navigator.pop(context);
                //     // Navigator.push(context,
                //     //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                //     push(context: context, screen: UnlockScreen());
                //   },
                //   child: Row(
                //     children: [
                //       Image.asset(MyImages.lips,height:16,width: 16,),
                //       hSizedBox,
                //       ParagraphText('UPLOADED/SEDUCTION',color: Colors.white,fontWeight: FontWeight.w500,)
                //     ],
                //   ),
                // ),
                // vSizedBox2,
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //     // Navigator.push(context,
                //     //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                //     push(context: context, screen: HomeMultiplePlayerScreen());
                //   },
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         MyImages.lips,
                //         height: 16,
                //         width: 16,
                //       ),
                //       hSizedBox,
                //       ParagraphText(
                //         'UPLOADED/SEDUCTION',
                //         color: Colors.white,
                //         fontWeight: FontWeight.w500,
                //       )
                //     ],
                //   ),
                // ),
                // vSizedBox2,
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //     // Navigator.push(context,
                //     //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                //     push(context: context, screen: HomeMultiplePlayerScreen());
                //   },
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         MyImages.strong,
                //         height: 15,
                //         width: 15,
                //       ),
                //       hSizedBox,
                //       ParagraphText(
                //         ' STRONG/PASSION',
                //         color: Colors.white,
                //         fontWeight: FontWeight.w500,
                //       )
                //     ],
                //   ),
                // ),
                // vSizedBox2,
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //     // Navigator.push(context,
                //     //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                //     push(context: context, screen: HomeMultiplePlayerScreen());
                //   },
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         MyImages.sex,
                //         height: 15,
                //         width: 15,
                //       ),
                //       hSizedBox,
                //       ParagraphText(
                //         'EXTREME/SEX',
                //         color: Colors.white,
                //         fontWeight: FontWeight.w500,
                //       )
                //     ],
                //   ),
                // ),
                // vSizedBox,
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
            color: Color(0xff000000).withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundEdgedButton(
              text: 'Play in Group',
              fontSize: 15,
              borderRadius: 15,
              color: MyColors.whiteColor,
              textColor: MyColors.primaryColor,
              height: 41,
              onTap: () {
                push(context: context, screen: HomeMultiplePlayerScreen());
              },
            ),
          ),
          vSizedBox05,
          Divider(
            thickness: 0.8,
            color: Color(0xff000000).withOpacity(0.3),
          ),
          vSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ParagraphText(
              'ACCOUNT',
              color: Color(0xff970634),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          vSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    push(context: context, screen: MonthlyPlan());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        MyImages.plan,
                        height: 15,
                        width: 15,
                      ),
                      hSizedBox,
                      ParagraphText(
                        'MONTHLY PLAN',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                vSizedBox2,
                GestureDetector(
                  onTap: () {
                    push(context: context, screen: EditProfile());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        MyImages.edit,
                        height: 16,
                        width: 16,
                      ),
                      hSizedBox,
                      ParagraphText(
                        'EDIT PROFILE',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                vSizedBox2,
                GestureDetector(
                  onTap: () {
                    push(context: context, screen: ChangePassword());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        MyImages.lock,
                        height: 15,
                        width: 15,
                      ),
                      hSizedBox,
                      ParagraphText(
                        ' CHANGE PASSWORD',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                vSizedBox2,
                GestureDetector(
                  onTap: () {
                    push(context: context, screen: TrasactionHistory());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        MyImages.clock,
                        height: 15,
                        width: 15,
                      ),
                      hSizedBox,
                      ParagraphText(
                        'TRANSACTION HISTORY',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                vSizedBox2,
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
            color: Color(0xff000000).withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundEdgedButton(
              text: 'LOGOUT',
              fontSize: 15,
              borderRadius: 15,
              color: MyColors.whiteColor,
              textColor: MyColors.primaryColor,
              height: 41,
              onTap: ()async {
                bool? result = await showCustomConfirmationDialog();
                if(result==true )await MyLocalServices.logout();
              },
            ),
          ),
          Center(
            child: ParagraphText(
              'Privacy Policy  |  Help  |  Terms and Conditions',
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          vSizedBox
        ],
      )),
    ),
  );
}
