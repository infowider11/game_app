
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:lottie/lottie.dart';
import '../functions/navigation_functions.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
  // late AnimationController _controller;

  void initState() {
    // // TODO: implement initState
    // _controller = AnimationController(duration: Duration(milliseconds: (1)), vsync: this,);
    Future.delayed(Duration(seconds:2)).then((value)  {
        pushReplacement(context: context, screen: LoginScreen());

    });
    // Future.delayed(Duration(seconds:5)).then((value)  {
    //   pushReplacement(context: context, screen: LoginScreen());
    // });
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
