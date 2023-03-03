import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/functions/validators.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/custom_text_field.dart';
import 'package:gameapp/widgets/dropdown.dart';

import '../constants/global_keys.dart';
import '../services/api_urls.dart';
import '../services/local_services.dart';
import '../services/webservices.dart';
import '../widgets/round_edged_button.dart';
import 'homescreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? gender;
  ValueNotifier<bool> pageLoad=ValueNotifier(false);
  ValueNotifier<bool> passwordShow=ValueNotifier(true);
  ValueNotifier<bool> confirmPasswordShow=ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.blackColor,
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              MyImages.bglogo,
            ))),
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSizedBox2,
                    Center(
                      child: Image.asset(
                        MyImages.splash,
                        height: 97,
                        width: 104,
                      ),
                    ),
                    // Center(
                    //   child: ParagraphText(
                    //     'Copia de Cream',
                    //     color: MyColors.primaryColor,
                    //     fontFamily: 'AbrilFatfaceRegular',
                    //     fontSize: 25,
                    //   ),
                    // ),
                    vSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainHeadingText('Versus',color:MyColors.whiteColor,fontSize:  35,fontWeight: FontWeight.w900,),
                        hSizedBox,
                        MainHeadingText('Hot',color:MyColors.primaryColor,fontSize: 35,fontWeight: FontWeight.w900,),
                      ],
                    ),
                    vSizedBox2,
                    ParagraphText(
                      'Signup',
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                    ParagraphText('Please enter below details.',
                        color: Color(0xffffffff)),
                    vSizedBox2,
                    CustomTextField(
                      controller: firstNameController,
                      hintText: 'First Name',
                      hintcolor: Colors.white,
                      textColor: Colors.white,
                      bgColor: Colors.transparent,
                      fontsize: 15,
                      borderRadius: 10,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    // vSizedBox2,
                    CustomTextField(
                      controller: lastNameController,
                      hintText: 'Last Name',
                      hintcolor: Colors.white,
                      textColor: Colors.white,
                      bgColor: Colors.transparent,
                      fontsize: 15,
                      borderRadius: 10,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    DropDwon(
                      items: ['Male', 'Female'],
                      selectedValue: gender,
                      onChanged: (val){
                        print('the val is ${val}');
                        gender = val;
                        setState(() {

                        });
                      },

                    ),
                    vSizedBox05,
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Enter Email',
                      hintcolor: Colors.white,
                      textColor: Colors.white,
                      bgColor: Colors.transparent,
                      fontsize: 15,
                      borderRadius: 10,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ValueListenableBuilder(
                      valueListenable: passwordShow,
                      builder: (context, value, child) {
                        return CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          hintcolor: Colors.white,
                          textColor: Colors.white,
                          bgColor: Colors.transparent,
                          fontsize: 15,
                          borderRadius: 10,
                          obscureText: value,
                          suffix: GestureDetector(
                            onTap: (){
                              passwordShow.value = !passwordShow.value;
                            },
                            child: Icon(
                              !value?Icons.visibility:Icons.visibility_off, color: MyColors.primaryColor,
                            ),
                          ),
                        );
                      }
                    ),
                    ValueListenableBuilder(
                        valueListenable: confirmPasswordShow,
                        builder: (context, value, child) {
                        return CustomTextField(
                          controller: confirmPasswordController,
                          hintcolor: Colors.white,
                          textColor: Colors.white,
                          hintText: 'Confirm Password',
                          bgColor: Colors.transparent,
                          borderRadius: 8,
                          obscureText: value,
                          suffix: GestureDetector(
                            onTap: (){
                              confirmPasswordShow.value = !confirmPasswordShow.value;
                            },
                            child: Icon(
                              !value?Icons.visibility:Icons.visibility_off, color: MyColors.primaryColor,
                            ),
                          ),
                        );
                      }
                    ),
                    // vSizedBox,
                    ValueListenableBuilder(
                        valueListenable: pageLoad,
                        builder: (context, pageLoadValue,child,) {
                        return RoundEdgedButton(
                          text: 'Signup',
                          fontSize: 20,
                          borderRadius: 10,
                          color: MyColors.primaryColor,
                          textColor: MyColors.whiteColor,
                          load: pageLoadValue,
                          onTap: ()async {
                            print('the data is ${gender}');
                            if (MyValidators.isStringInvalid(firstNameController.text, 'Please enter your first name.') ||
                                MyValidators.isStringInvalid(lastNameController.text, 'Please enter your last name.') ||
                                MyValidators.isStringInvalid(gender, 'Please select your gender.') ||
                            MyValidators.isEmailInvalid(emailController.text) ||
                            MyValidators.isPasswordInvalid(passwordController.text) ||
                                MyValidators.isPasswordInvalid(confirmPasswordController.text) ||
                            MyValidators.isPasswordMatched(passwordController.text, confirmPasswordController.text)
                            ) {}
                            else {
                              print('I am here');
                              pageLoad.value=true;
                              var request = {
                                'first_name':firstNameController.text,
                                'last_name':lastNameController.text,
                                'gender':gender,
                                'email': emailController.text,
                                'password': passwordController.text,
                              };
                              var jsonResponse = await Webservices.postData(apiUrl: ApiUrls.signup, request: request);
                              if(jsonResponse['status']==1){
                                MyLocalServices.updateSharedPreferences(jsonResponse['data']);
                                Navigator.popUntil(MyGlobalKeys.navigatorKey.currentContext!, (route) => route.isFirst);
                                await pushReplacement(context: MyGlobalKeys.navigatorKey.currentContext!, screen: HomeScreen());
                            // pageLoad.value=false;

                            }else{
                            // await Future.delayed(Duration(seconds: 10));
                            pageLoad.value=false;
                            }

                          }
                          },
                        );
                      }
                    ),
                    vSizedBox,
                    GestureDetector(
                      onTap: () {
                        push(context: context, screen: LoginScreen());
                      },
                      child: Center(
                        child: RichText(
                            text: TextSpan(
                                text: 'I have already Account?  ',
                                style: TextStyle(
                                    color: MyColors.whiteColor,
                                    fontFamily: 'Regular',
                                    fontSize: 13),
                                children: [
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      color: MyColors.primaryColor,
                                      fontFamily: 'Regular',
                                      decoration: TextDecoration.underline,
                                      fontSize: 13))
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
