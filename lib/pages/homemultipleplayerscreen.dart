import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/constants/box_shadow.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/pages/homescreen.dart';
import 'package:gameapp/pages/matchingscreen.dart';
import 'package:gameapp/pages/questionscreen.dart';
import 'package:gameapp/widgets/appbar.dart';
import 'package:gameapp/widgets/custom_text_field.dart';
import 'package:gameapp/widgets/dropdown.dart';
import 'package:gameapp/widgets/round_edged_button.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/drawer.dart';
class HomeMultiplePlayerScreen extends StatefulWidget {
  const HomeMultiplePlayerScreen({Key? key}) : super(key: key);

  @override
  State<HomeMultiplePlayerScreen> createState() => _HomeMultiplePlayerScreenState();
}

class _HomeMultiplePlayerScreenState extends State<HomeMultiplePlayerScreen> {
  String? selectedValue;
  List iconlist=[
    MyImages.male,
    MyImages.female
    // Icon(Icons.female,color: Colors.white,size: 40,),
    // Icon(Icons.male,color: Colors.white,size: 40,),
  ];
  TextEditingController code=TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: get_drawer(context,),
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: appbar1('John Smith',(){scaffoldKey.currentState?.openDrawer();}),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText('Select Game Level',color: Colors.white,fontSize: 15,),
                DropDwon(
                  islabel: true,
                  label: 'hfgh',
                  labelcolor: Colors.white,
                  items: [
                   'MILD/FRIENDSHIP','UPLOADED/SEDUCTION','STRONG/PASSION','EXTREME/SEX'
                  ],
                ),
                vSizedBox2,
                vSizedBox2,
                Container(
                    width: 105,height: 86,
                    decoration: BoxDecoration(
                      // boxShadow: [shadow],
                      border:null,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),

                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(MyImages.gender,height: 31,width: 25,),
                        ParagraphText('Straight',color: MyColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w500,)
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      // boxShadow: [shadow],
                      border:null,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )
                    ),
                    child: Column(
                      children: [
                        vSizedBox05,
                        Stack(
                          children: [
                            CustomTextField(
                              controller: code,
                              hintcolor: Colors.white,
                              textColor: Colors.white,
                              hintText: 'Woman’s Name',
                              bgColor:Colors.black,
                              borderRadius:10,
                              obscureText: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 50),
                            ),
                            Positioned(
                              top:7,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 50,width: 52,
                                  decoration: BoxDecoration(
                                      color: MyColors.primaryColor,
                                      borderRadius:BorderRadius.circular(10)
                                  ),
                                  child:Image.asset(MyImages.female,)
                              ),
                            ),



                          ],
                        ),
                        Stack(
                          children: [
                            CustomTextField(
                              controller: code,
                              hintcolor: Colors.white,
                              textColor: Colors.white,
                              hintText: 'Men Name',
                              bgColor:Colors.black,
                              borderRadius:10,
                              obscureText: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 50),
                            ),
                            Positioned(
                              top:7,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 50,width: 52,
                                  decoration: BoxDecoration(
                                      color: MyColors.primaryColor,
                                      borderRadius:BorderRadius.circular(10)
                                  ),
                                  child:Image.asset(MyImages.male,)
                              ),
                            ),



                          ],
                        ),
                        Stack(
                          children: [
                            CustomTextField(
                              controller: code,
                              hintcolor: Colors.white,
                              textColor: Colors.white,
                              hintText:selectedValue.toString()=='assets/icons/male.png'?"Men's Name":
                              selectedValue.toString()=='assets/icons/female.png'?'Woman’s Name':'Woman’s Name',
                              bgColor:Colors.black,
                              borderRadius:10,
                              obscureText: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 70),
                            ),
                            Positioned(
                              top:7,
                              child:DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isDense:true,
                                  isExpanded: true,
                                  hint:Image.asset(iconlist[0],height: 30,),
                                  items:iconlist
                                      .map((item) => DropdownMenuItem<dynamic>(
                                    value: item,
                                    child:Image.asset(item,height: 30,),))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value ;
                                      print(selectedValue);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.expand_more_outlined,
                                  ),
                                  iconSize:25,
                                  iconEnabledColor: MyColors.whiteColor,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight:50,
                                  buttonWidth:70,
                                  buttonPadding: const EdgeInsets.only(left:10, right:0,top: 5),
                                  buttonDecoration: BoxDecoration(
                                    boxShadow: [shadow],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: MyColors.primaryColor,width: 0.5
                                    ),
                                    // color: MyColors.primaryColor,
                                    color:MyColors.primaryColor,

                                    // color: Colors.transparent,
                                  ),
                                  buttonElevation: 0,
                                  itemHeight: 30,
                                  itemPadding: const EdgeInsets.only(left:10, right: 0,),
                                  dropdownMaxHeight: 500,
                                  dropdownWidth:70,
                                  dropdownPadding:null,
                                  dropdownDecoration: BoxDecoration(
                                    boxShadow: [shadow],
                                    borderRadius: BorderRadius.circular(5),
                                    color:MyColors.primaryColor,
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

                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8,vertical: 20),
                                child: Icon(Icons.cancel,color: Colors.red,),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon((Icons.add),color:MyColors.primaryColor,size: 15,),
                            ParagraphText('Add Player',color: MyColors.primaryColor,fontSize:15,underlined: true,)
                          ],
                        ),
                        RoundEdgedButton(text: 'Start the game',fontSize: 20,borderRadius:10,color:MyColors.primaryColor,textColor: MyColors.whiteColor,onTap: (){push(context: context, screen: MatchingScreen());},),
                      ],
                    )

                ),
                vSizedBox8,
                vSizedBox8,
                GestureDetector(
                  onTap: (){
                    push(context: context, screen: HomeScreen());
                  },
                  child: Center(
                    child: ParagraphText
                      ('Two players?',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15,underlined: true,),
                  ),
                ),



              ],
            ),
          ),
        ),

      ),
    );
  }
}
