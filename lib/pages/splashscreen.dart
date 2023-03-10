
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/pages/loginscreen.dart';
import 'package:gameapp/services/api_urls.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/global_data.dart';
import '../functions/navigation_functions.dart';
import '../modals/game_level_modal.dart';
import '../services/local_services.dart';
import '../services/webservices.dart';
import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
  // late AnimationController _controller;



  getGameLevels()async{
    List gameLevelsList = await Webservices.getList(ApiUrls.getGameLevels);
    gameLevels = List.generate(gameLevelsList.length, (index) => GameLevelModal.fromJson(gameLevelsList[index])).toList();
  }

  initializeEverything()async{
    await getGameLevels();

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
           vSizedBox2,
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               MainHeadingText('Versus',color:MyColors.whiteColor,fontSize:  40,fontWeight: FontWeight.w900,),
               hSizedBox,
               MainHeadingText('Hot',color:MyColors.primaryColor,fontSize: 40,fontWeight: FontWeight.w900,),
             ],
           )
         ],
       ),

     )

    );
  }
}
