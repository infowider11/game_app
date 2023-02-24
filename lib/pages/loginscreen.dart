
import 'package:flutter/material.dart';
import 'package:gameapp/functions/validators.dart';
import 'package:gameapp/pages/forgotpassword.dart';
import 'package:gameapp/pages/homescreen.dart';
import 'package:gameapp/pages/signupscreen.dart';
import 'package:gameapp/services/api_urls.dart';
import 'package:gameapp/services/local_services.dart';
import 'package:gameapp/services/webservices.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/global_keys.dart';
import '../constants/images_url.dart';
import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/round_edged_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  ValueNotifier<bool> pageLoad=ValueNotifier(false);
  // bool check=true;
  @override
  Widget build(BuildContext context) {
    // pageLoad.value=true;
    return SafeArea(
      child: Scaffold(
          backgroundColor:MyColors.blackColor,
          body:Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MyImages.bglogo,)
              )
            ),
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSizedBox6,
                    Center(child: Image.asset(MyImages.splash,height: 97,width: 104,),),
                    Center(child: ParagraphText('Copia de Cream',color:MyColors.primaryColor,fontFamily: 'AbrilFatfaceRegular',fontSize: 25,),

                    ),
                    vSizedBox2,
                    ParagraphText('Login',color: Color(0xffffffff),fontWeight: FontWeight.w600,fontSize: 22,),
                    ParagraphText('Hello welcome back to our account',color: Color(0xffffffff)),
                    vSizedBox2,
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Enter Email',
                      hintcolor: Colors.white,
                      textColor: Colors.white,
                      bgColor:Colors.transparent,
                      fontsize: 15,
                      borderRadius:10,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintcolor: Colors.white,
                      textColor: Colors.white,

                      hintText: 'Enter Password',
                      bgColor:Colors.transparent,
                      borderRadius: 8,
                      obscureText: true,
                    ),
                    vSizedBox2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            push(context: context, screen: ForgotPassword());
                          },
                            child: ParagraphText('Forgot Password?',color: Color(0xffffffff),))
                      ],
                    ),
                    vSizedBox2,
                    ValueListenableBuilder(
                      valueListenable: pageLoad,
                      builder: (context, pageLoadValue,child,) {
                        return RoundEdgedButton(text: 'Login',
                          fontSize: 20,
                          borderRadius:10,
                          color:MyColors.primaryColor,
                          textColor: MyColors.whiteColor,
                          load: pageLoadValue,
                          onTap: ()async{

                          if(MyValidators.isEmailInvalid(emailController.text) && MyValidators.isPasswordInvalid(passwordController.text)){

                          }else{
                            pageLoad.value=true;
                            var request = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };
                            var jsonResponse = await Webservices.postData(apiUrl: ApiUrls.login, request: request);
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
                          },);
                      }
                    ),

                    vSizedBox2,
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: SignupScreen());
                      },
                      child: Center(
                        child: RichText
                          (text: TextSpan(
                          text: 'If you don’t have an Account? ',
                          style: TextStyle(color: MyColors.whiteColor,fontFamily: 'Regular',fontSize: 13),
                          children: [
                            TextSpan(
                              text: ' Sign up',style: TextStyle(color: MyColors.primaryColor,fontFamily: 'Regular',decoration: TextDecoration.underline,fontSize: 13)
                            )
                          ]
                        )),
                      ),
                    ),
                  ],

                ),
              ),
            ),
          )

      ),
    );
  }
}
