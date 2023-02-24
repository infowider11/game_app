import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/constants/box_shadow.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/pages/homemultipleplayerscreen.dart';
import 'package:gameapp/pages/matchingscreen.dart';
import 'package:gameapp/pages/unlock_screen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/drawer.dart';
import 'package:gameapp/widgets/dropdown.dart';

import '../functions/navigation_functions.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/round_edged_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController woman =TextEditingController();
  TextEditingController man=TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _img = new Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/TUCPamplona10.svg/500px-TUCPamplona10.svg.png");
  String? choosenValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: get_drawer(context,),
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: appbar1(onTap: (){scaffoldKey.currentState?.openDrawer();}),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
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
                  selectedValue: choosenValue,

                  onChanged: (value){
                    setState(() {choosenValue = value as String?;});
                    choosenValue == "UPLOADED/SEDUCTION" || choosenValue == "STRONG/PASSION" || choosenValue == "EXTREME/SEX" ?
                        push(context: context, screen: UnlockScreen()) : null;
                  },
                ),
                vSizedBox2,
                vSizedBox2,
                Container(
                  width: 105,height: 86,
                  decoration: BoxDecoration(
                    // boxShadow: [shadow],
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
                    height: 238,
                  decoration: BoxDecoration(
                      // boxShadow: [shadow],
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
                            controller: woman,
                            hintcolor: Colors.white,
                            textColor: Colors.white,
                            hintText: 'Woman’s Name',
                            bgColor:Colors.black,
                            borderRadius:10,
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
                            controller: man,
                            hintcolor: Colors.white,
                            textColor: Colors.white,
                            hintText: 'Men Name',
                            bgColor:Colors.black,
                            borderRadius:10,
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
                      RoundEdgedButton(text: 'Start the game',fontSize: 20,borderRadius:10,color:MyColors.primaryColor,textColor: MyColors.whiteColor,
                        onTap: (){push(context: context, screen: MatchingScreen());},),

                    ],
                  )

                ),
                vSizedBox2,
                GestureDetector(
                  onTap: (){
                    push(context: context, screen: HomeMultiplePlayerScreen());
                  },
                  child: Center(
                    child: ParagraphText
                      ('Play in Group?',color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15,underlined: true,),
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
