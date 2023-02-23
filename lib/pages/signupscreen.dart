import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/custom_text_field.dart';
import 'package:gameapp/widgets/dropdown.dart';

import '../widgets/round_edged_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? gender;
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSizedBox6,
                    Center(
                      child: Image.asset(
                        MyImages.splash,
                        height: 97,
                        width: 104,
                      ),
                    ),
                    Center(
                      child: ParagraphText(
                        'Copia de Cream',
                        color: MyColors.primaryColor,
                        fontFamily: 'AbrilFatfaceRegular',
                        fontSize: 25,
                      ),
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
                      controller: fullNameController,
                      hintText: 'Full Name',
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
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      hintcolor: Colors.white,
                      textColor: Colors.white,
                      bgColor: Colors.transparent,
                      fontsize: 15,
                      borderRadius: 10,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintcolor: Colors.white,
                      textColor: Colors.white,
                      hintText: 'Confirm Password',
                      bgColor: Colors.transparent,
                      borderRadius: 8,
                      obscureText: true,
                    ),
                    vSizedBox2,
                    RoundEdgedButton(
                      text: 'Signup',
                      fontSize: 20,
                      borderRadius: 10,
                      color: MyColors.primaryColor,
                      textColor: MyColors.whiteColor,
                      onTap: () {
                        print('the data is ${gender}');
                        if (fullNameController.text.isNotEmpty) {
                        } else if (passwordController.text.isNotEmpty) {
                        } else {}
                      },
                    ),
                    vSizedBox2,
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
