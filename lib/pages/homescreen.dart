import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/constants/box_shadow.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/global_data.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/modals/game_user_modal.dart';
import 'package:gameapp/pages/homemultipleplayerscreen.dart';
import 'package:gameapp/pages/matchingscreen.dart';
import 'package:gameapp/pages/new_animation_screen.dart';
import 'package:gameapp/pages/unlock_screen.dart';
import 'package:gameapp/services/webservices.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/drawer.dart';
import 'package:gameapp/widgets/dropdown.dart';
import 'package:gameapp/widgets/showSnackbar.dart';

import '../functions/navigation_functions.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_dropdown_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/round_edged_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController womanNameController = TextEditingController();
  TextEditingController manNameController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _img = new Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/TUCPamplona10.svg/500px-TUCPamplona10.svg.png");




   double height=52;
   String hintText= 'Select Game Level';
   Color borderColor =MyColors.primaryColor;
   String keyValue = 'title';

  final ValueNotifier<bool> showDropDown = ValueNotifier(false);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: get_drawer(
          context,scaffoldKey
        ),
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: appbar1(onTap: () {
          scaffoldKey.currentState?.openDrawer();
        }),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ParagraphText(
                  'Select Game Level',
                  color: Colors.white,
                  fontSize: 15,
                ),
                // CustomDropdownWidget(
                //   items: gameLevelsList,
                //   hintText: 'Select Game Level', selectedItem: selectedGameLevel,
                // ),
                ValueListenableBuilder(
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
                                          valueListenable: selectedGameLevel,
                                          builder: (context, value, child) {
                                            return Text(
                                              value==null?hintText:value!.name,
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
                                    for(int i = 0;i<gameLevels.length;i++)
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: ()async{

                                          if(gameLevels[i].isFree){
                                            selectedGameLevel.value = gameLevels[i];
                                          }else{
                                            push(context: context, screen: UnlockScreen());
                                          }
                                          print('the value is ${selectedGameLevel.value}');
                                          showDropDown.value = false;
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 12),
                                          child: ParagraphText(gameLevels[i].name, color: Colors.white,),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            )

                        ],
                      );
                    }
                ),
                vSizedBox2,
                vSizedBox2,
                Container(
                    width: 105,
                    height: 86,
                    decoration: BoxDecoration(
                      // boxShadow: [shadow],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          MyImages.gender,
                          height: 31,
                          width: 25,
                        ),
                        ParagraphText(
                          'Straight',
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 238,
                    decoration: BoxDecoration(
                        // boxShadow: [shadow],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                    child: Column(
                      children: [
                        vSizedBox05,
                        Stack(
                          children: [
                            CustomTextField(
                              controller: womanNameController,
                              hintcolor: Colors.white,
                              textColor: Colors.white,
                              hintText: 'Woman’s Name',
                              bgColor: Colors.black,
                              borderRadius: 10,
                              maxLength: 8,

                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50),
                            ),
                            Positioned(
                              top: 7,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 50,
                                  width: 52,
                                  decoration: BoxDecoration(
                                      color: MyColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    MyImages.female,
                                  )),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            CustomTextField(
                              controller: manNameController,
                              hintcolor: Colors.white,
                              textColor: Colors.white,
                              hintText: 'Man\'s Name',
                              bgColor: Colors.black,
                              maxLength: 8,
                              borderRadius: 10,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50),
                            ),
                            Positioned(
                              top: 7,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 50,
                                  width: 52,
                                  decoration: BoxDecoration(
                                      color: MyColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    MyImages.male,
                                  )),
                            ),
                          ],
                        ),
                        RoundEdgedButton(
                          text: 'Start the game',
                          fontSize: 20,
                          borderRadius: 10,
                          color: MyColors.primaryColor,
                          textColor: MyColors.whiteColor,
                          onTap: () {

                            FocusScope.of(context).requestFocus(FocusNode());
                            if(selectedGameLevel.value==null){
                              showSnackbar('Please Select the game level');
                            }
                            else if(womanNameController.text.isEmpty){
                              showSnackbar('Please Type woman name');
                            }else if(manNameController.text.isEmpty){
                              showSnackbar('Please Type man name');
                            }else if(!selectedGameLevel.value!.isFree){
                              push(context: context, screen: UnlockScreen());
                            }else{
                              List<GameUserModal> gameUsers= [];
                              gameUsers.add(
                                  GameUserModal(userName: manNameController.text, gender: Gender.male)
                              );
                              gameUsers.add(
                                  GameUserModal(userName: womanNameController.text, gender: Gender.female)
                              );

                              push(
                                  context: context, screen: NewAnimationScreen(gameUsers: gameUsers,));
                            }

                          },
                        ),
                      ],
                    )),
                vSizedBox2,
                GestureDetector(
                  onTap: () {
                    push(context: context, screen: HomeMultiplePlayerScreen());
                  },
                  child: Center(
                    child: ParagraphText(
                      'Play in Group?',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      underlined: true,
                    ),
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
