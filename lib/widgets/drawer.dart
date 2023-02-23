import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gameapp/constants/box_shadow.dart';
import 'package:gameapp/constants/images_url.dart';
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

import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';

import '../pages/homescreen.dart';
import '../widgets/CustomTexts.dart';


Drawer get_drawer(BuildContext context ){
TextEditingController  emailcontroller = TextEditingController();
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

        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:40,right: 20,left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ParagraphText('PROFILE',color: Color(0xff970634),fontSize: 15,fontWeight:FontWeight.w600,),
                      ParagraphText('ID: 351ASDF',color: Colors.white,fontWeight: FontWeight.w600,)
                    ],
                  ),
                  vSizedBox,
                  Row(
                    children: [
                      Icon((Icons.person),color: Colors.white,size: 20,),
                      hSizedBox,
                      ParagraphText('John Smith ',fontWeight: FontWeight.w500,color: Colors.white,)
                    ],
                  ),
                  Row(
                    children: [
                      Icon((Icons.mail),color: Colors.white,size: 20,),
                      hSizedBox,
                      ParagraphText('smith.john@gmail.com ',fontWeight: FontWeight.w500,color: Colors.white,)
                    ],
                  ),
                ],
              ),
            ),
            vSizedBox05,
            Divider(
              thickness:2,color: Color(0xff000000).withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParagraphText('Language',color: Color(0xff970634),fontSize: 15,fontWeight:FontWeight.w600,),
                  DropDwon(
                    buttoncolorColor: Color(0xffb72654),
                    items: ['English','Germany'],
                    dropdownWidth: 50,
                  ),

                ],
              ),
            ),
            vSizedBox05,
            Divider(
              thickness:0.8,color: Color(0xff000000).withOpacity(0.3),
            ),
            vSizedBox05,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParagraphText('SELECT GAME LEVEL',color: Color(0xff970634),fontSize: 15,fontWeight:FontWeight.w600,),
                  vSizedBox2,
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      // Navigator.push(context,
                      //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                      push(context: context, screen: HomeMultiplePlayerScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(MyImages.kela,height: 15,width: 15,),
                        hSizedBox,
                        ParagraphText('MILD/FRIENDSHIP',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      // Navigator.push(context,
                      //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                      push(context: context, screen: HomeMultiplePlayerScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(MyImages.lips,height:16,width: 16,),
                        hSizedBox,
                        ParagraphText('UPLOADED/SEDUCTION',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      // Navigator.push(context,
                      //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                      push(context: context, screen: HomeMultiplePlayerScreen());
                    },
                    child: Row
                      (
                      children: [
                        Image.asset(MyImages.strong,height: 15,width: 15,),
                        hSizedBox,
                        ParagraphText(' STRONG/PASSION',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      // Navigator.push(context,
                      //   PageTransition(type: PageTransitionType.rightToLeft, child: HomeMultiplePlayerScreen(),),);
                      push(context: context, screen: HomeMultiplePlayerScreen());
                    },
                    child: Row
                      (
                      children: [
                        Image.asset(MyImages.sex,height: 15,width: 15,),
                        hSizedBox,
                        ParagraphText('EXTREME/SEX',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox,

                ],
              ),
            ),
            Divider(
              thickness:0.8,color: Color(0xff000000).withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: RoundEdgedButton(text: 'Play in Group',fontSize:15,borderRadius:15,color:MyColors.whiteColor,textColor: MyColors.primaryColor,height: 41,onTap: (){
                push(context: context, screen: HomeMultiplePlayerScreen());
              },),
            ),
            vSizedBox05,
            Divider(
              thickness:0.8,color: Color(0xff000000).withOpacity(0.3),
            ),
            vSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ParagraphText('ACCOUNT',color: Color(0xff970634),fontSize: 15,fontWeight:FontWeight.w600,),
            ),
            vSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GestureDetector(
                    onTap: (){
                      push(context: context, screen: MonthlyPlan());
                    },
                    child: Row(
                      children: [
                        Image.asset(MyImages.plan,height: 15,width: 15,),
                        hSizedBox,
                        ParagraphText('MONTHLY PLAN',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap: (){
                      push(context: context, screen: EditProfile());
                    },
                    child: Row(
                      children: [
                        Image.asset(MyImages.edit,height:16,width: 16,),
                        hSizedBox,
                        ParagraphText('EDIT PROFILE',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap: (){
                      push(context: context, screen: ChangePassword());
                    },
                    child: Row(
                      children: [
                        Image.asset(MyImages.lock,height: 15,width: 15,),
                        hSizedBox,
                        ParagraphText(' CHNAGE PASSWORD',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap:(){
                      push(context: context, screen: TrasactionHistory());
                    },
                    child: Row(
                      children: [
                        Image.asset(MyImages.clock,height: 15,width: 15,),
                        hSizedBox,
                        ParagraphText('TRANSACTION HISTORY',color: Colors.white,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  vSizedBox2,

                ],
              ),
            ),
            Divider(
              thickness:0.8,color: Color(0xff000000).withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: RoundEdgedButton(text: 'LOGOUT',fontSize:15,borderRadius:15,color:MyColors.whiteColor,textColor: MyColors.primaryColor,height: 41,onTap: (){
                pushReplacement(context: context, screen: LoginScreen());
              },),
            ),
            Center(child: ParagraphText('Privacy Policy  |  Help  |  Terms and Conditions',color: Colors.white, fontSize: 12,),),
            vSizedBox










          ],)
      ),
    ),
  );

}