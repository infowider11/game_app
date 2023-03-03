import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/global_data.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/modals/game_user_modal.dart';
import 'package:gameapp/modals/user_modal.dart';
import 'package:gameapp/pages/questionscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/appbar.dart';
import 'package:gameapp/widgets/custom_confirmation_dialog.dart';
import 'package:gameapp/widgets/drawer.dart';
import 'package:gameapp/widgets/round_edged_button.dart';

import '../constants/global_keys.dart';
import '../functions/navigation_functions.dart';

class MatchedScreen extends StatefulWidget {
  final int selectedUserIndex;
  final List<GameUserModal> users;
  const MatchedScreen({
    Key? key,
    required this.selectedUserIndex,
    required this.users,
  }) : super(key: key);

  @override
  State<MatchedScreen> createState() => _MatchedScreenState();
}

class _MatchedScreenState extends State<MatchedScreen>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _controller;
  late Animation<double> _animation;
  int seconds = 2;

  //
  // startAnimation()async{
  //   _controller = AnimationController(
  //       vsync: this,
  //       duration: Duration(seconds: seconds),
  //       animationBehavior: AnimationBehavior.preserve
  //   );
  //   _animation = Tween<double>(begin: 0, end: 5).animate(_controller)
  //     ..addListener(() {
  //     });
  // }

  final _opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  startAnimation() async {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.forward();
    _animation = _opacityTween.animate(_controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    startAnimation();
    super.initState();
  }



  animationInTheStart()async{
    _controller.repeat();
    await Future.delayed(Duration(seconds: 2));
    _controller.stop();
  }
  @override
  Widget build(BuildContext context) {
    // _controller.forward();
    return WillPopScope(
      onWillPop: ()async{
        print('matched screen will Pop called');
        bool? result = await showCustomConfirmationDialog(
          description: 'The game will be ended, if you click yes'
        );
        if(result==true){
          Navigator.pop(context);
          Navigator.pop(MyGlobalKeys.navigatorKey.currentContext!);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        key: scaffoldKey,
        drawer: get_drawer(context, scaffoldKey),
        appBar: appbar1(onTap: () {
          scaffoldKey.currentState?.openDrawer();
        }),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(MyImages.bglogo))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    // print('the controller opacity is');
                    return Opacity(
                      opacity: _opacityTween.evaluate(_controller),
                      child: RoundEdgedButton(
                        text: 'Truth',
                        color: MyColors.primaryColor,
                        width: 176,
                        borderRadius: 8,
                        height: 52,
                        fontSize: 20,
                        verticalMargin: 0,
                        onTap: () {
                          push(context: context, screen: QuestionScreen(questionType: QuestionType.truth,users: widget.users,selectedUserIndex: widget.selectedUserIndex,));
                        },
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      MyImages.spinner,
                      height: 400,
                      width: 400,
                    ),
                    Image.asset(
                      MyImages.spinner2,
                      height: 295,
                      width: 295,
                    ),
                    Image.asset(
                      MyImages.spinner1,
                      height: 213,
                      width: 213,
                    ),
                    GestureDetector(
                      onTap: () {
                        // push(context: context, screen: MatchedScreen());
                      },
                      child: Hero(
                        tag: 'hero0',
                        transitionOnUserGestures: true,
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColors.primaryColor,
                              border:
                                  Border.all(color: Color(0xffCE1C55), width: 6)),
                          child: Center(
                            child: Material(
                              color: Colors.transparent,
                              child: ParagraphText(
                                '${widget.users[widget.selectedUserIndex].userName}',
                                color: Colors.white,
                                textAlign: TextAlign.center,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    // print('the controller opacity is');
                    return Opacity(
                      opacity: _opacityTween.evaluate(_controller),
                    child: RoundEdgedButton(
                      text: 'Dare',
                      color: MyColors.primaryColor,
                      width: 176,
                      borderRadius: 8,
                      height: 52,
                      fontSize: 20,
                      verticalMargin: 0,
                      onTap: () {
                        push(context: context, screen: QuestionScreen(questionType: QuestionType.dare,users: widget.users,selectedUserIndex: widget.selectedUserIndex,));
                      },
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
