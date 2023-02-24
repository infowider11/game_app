
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../functions/navigation_functions.dart';
import '../services/local_services.dart';
import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
  // late AnimationController _controller;



  initializeEverything()async{
    bool isLoggedIn = await MyLocalServices.isLoggedIn();
    if(isLoggedIn){
      pushReplacement(context: context, screen: HomeScreen());
    }else{
      pushReplacement(context: context, screen: LoginScreen());
    }

  }

  void initState() {
    // // TODO: implement initState
    // _controller = AnimationController(duration: Duration(milliseconds: (1)), vsync: this,);
    initializeEverything();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff000000),
     body:Center(
       child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset(MyImages.splash,height: 172,width: 184,),
           ParagraphText('Copia de Cream',color:MyColors.primaryColor,fontFamily: 'AbrilFatfaceRegular',fontSize: 25,)
         ],
       )

     )

    );
  }
}
