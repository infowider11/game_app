import 'package:flutter/material.dart';
import 'package:gameapp/constants/global_data.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/modals/game_user_modal.dart';
import 'package:gameapp/services/api_urls.dart';
import 'package:gameapp/services/local_services.dart';
import 'package:gameapp/services/webservices.dart';
import 'package:gameapp/widgets/appbar.dart';
import 'package:gameapp/widgets/showSnackbar.dart';

import '../constants/images_url.dart';
import '../widgets/CustomTexts.dart';
import 'matchedscreen.dart';

class NewAnimationScreen extends StatefulWidget {
  final List<GameUserModal> gameUsers;
  const NewAnimationScreen({Key? key, required this.gameUsers}) : super(key: key);

  @override
  State<NewAnimationScreen> createState() => _NewAnimationScreenState();
}

class _NewAnimationScreenState extends State<NewAnimationScreen> with TickerProviderStateMixin{

  late AnimationController _controller;
  late AnimationController parentController;
  late Animation<double> _animation;
  late AnimationController userWidgetStartAnimationController;
  late Animation<double> userWidgetStartAnimation;

   double startDoubleValue = 1;
  int seconds = 4;

  ValueNotifier<int> selectedUserIndex = ValueNotifier(1);

   ValueNotifier<double> margin = ValueNotifier(10);
   ValueNotifier<double> opacity = ValueNotifier(1);
  List<Widget> participants = [
  ];


  userWidgetAnimate(){
    print('Animatinggg.............');
    userWidgetStartAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      // animationBehavior: AnimationBehavior.
    );

    // Create a tween animation to define the range of values to animate
    userWidgetStartAnimation = Tween<double>(begin: 0, end: startDoubleValue).animate(userWidgetStartAnimationController);

    userWidgetStartAnimation.addListener(() {
      print('kjhhhhdfsfssdshkkjkj ${userWidgetStartAnimation.value}');
    });

    // Start the animation when the widget is first built
    userWidgetStartAnimationController.forward();
    // userWidgetStartAnimation.drive(AlignmentTween(
    //   begin: Alignment.topLeft,
    //   end: Alignment.topRight,
    // ),);
    // userWidgetStartAnimationController.repeat();

  }



  // ValueNotifier<double> backSpinnnerSize = ValueNotifier(230);




  initializeAnimation(){
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: seconds),
        animationBehavior: AnimationBehavior.preserve
    )
    ;

    parentController = AnimationController(duration: const Duration(milliseconds: 1800), vsync: this);
    // _animation = Tween<double>(begin: 0, end: 0)
    _animation = Tween<double>(begin: 0, end: 5).animate(_controller);
      // ..addListener(() {
      //   // padding =10+ _animation.value * 5;
      //   margin.value = 10+ _animation.value * 36;
      //   print('...the magin is ${_animation.value} now ${margin.value} amd size is ${(MediaQuery.of(context).size.width/2)}');
      //   if(margin.value>=(MediaQuery.of(context).size.width/2)-40){
      //     print('the magin is now ${margin.value} amd size is ${(MediaQuery.of(context).size.width/2)}');
      //     _controller.stop();
      //     pushReplacement(context: context, screen: MatchedScreen());
      //   }
      //   // print('the backspinner  dd value is ${backSpinnnerSize.value} annn ${_animation.value} ..${backSpinnnerSize.value>=400}');
      //   // backSpinnnerSize.value = backSpinnnerSize.value + (backSpinnnerSize.value>=400?(-((_animation.value * 10)%15)):(_animation.value * 10)%15);
      //   // print('the backspinner value is ${backSpinnnerSize.value}');
      // });
    parentController.repeat(reverse: true);

    // Future.delayed(Duration(seconds: 10)).then((value){
    //   parentController.stop();
    // });
  }






  // Map? questionData;
  startAnimation()async{
    // participants.shuffle();
    print('Starting animation');
    var request = {
      'game_level': selectedGameLevel.value!.id.toString(),
      'question_for':'1',
      'gender':widget.gameUsers[selectedUserIndex.value].gender.name,
    };
    Webservices.postData(apiUrl: ApiUrls.getBothQuestions, request: request, isGetMethod: true).then((jsonResponse){
      if(jsonResponse['status']==1){
        questionData.value = jsonResponse['data'];
      }
    });
    _animation.removeListener(() { });
    _controller.repeat(period: Duration(seconds: 4));
    _animation = Tween<double>(begin: 0, end: 5).animate(_controller);
      _animation.addListener(() async{
        margin.value = 10+ _animation.value * 36;
        print('...the magin is ${_animation.value} now ${margin.value} amd size is ${(MediaQuery.of(context).size.width/2)}');
        if(margin.value>=(MediaQuery.of(context).size.width/2)-40){
          print('the magin is now ${margin.value} amd size is ${(MediaQuery.of(context).size.width/2)}');
          _controller.stop();
          if(questionData.value==null){
            showSnackbar('Server did not responded. Please try again later!');
            await push(context: context, screen: MatchedScreen(selectedUserIndex:selectedUserIndex.value,users: widget.gameUsers,));
          }else{
            await push(context: context, screen: MatchedScreen(selectedUserIndex:selectedUserIndex.value,users: widget.gameUsers,));
          }
          var temp = participants.removeAt(selectedUserIndex.value);
          selectedUserIndex.value = (selectedUserIndex.value+1)%widget.gameUsers.length;
          margin.value = 10;
          opacity.value = 1;
          // userWidgetStartAnimationController.dispose();
          // userWidgetStartAnimation.removeListener(() { });
          // userWidgetAnimate();
          // userWidgetStartAnimationController.repeat(reverse: true,period: Duration(seconds: 3) );
          userWidgetStartAnimationController.forward(from: 0.3);

          participants.add(temp);



          // userWidgetStartAnimationController.value = 0;
          // userWidgetStartAnimationController.forward();
          setState(() {

          });
          initializeAnimation();



        }
      });
  }


  addAllParticipants(){

    for(int i =0;i<widget.gameUsers.length;i++){
      addParticipant(widget.gameUsers[i], i);
    }
    setState(() {

    });
  }


  addParticipant(GameUserModal gameUserModal, int i){
    print('adding with ${participants.length}');
    participants.add(
      AnimatedBuilder(
        animation: userWidgetStartAnimation,
        builder: (context, child) {
          print('the animation value is ${userWidgetStartAnimation.value}');
          return ValueListenableBuilder<double>(
              valueListenable: margin,
              builder: (context, value,child) {

                // value = 10 ///margin
                // i = 1,2,3,4
                // vvv = 1..3
                // margin.value>=(MediaQuery.of(context).size.width/2)-40
                double vvv = userWidgetStartAnimation.value==0?0.2:userWidgetStartAnimation.value;
                double a = (((MediaQuery.of(context).size.width)/2-40)/(value*vvv))-userWidgetStartAnimation.value*5;

                print('the a is $a and margin is $value and user vvv $vvv and ${((MediaQuery.of(context).size.width)/2-40)}');
                return Positioned(
                  // left:i==0?userWidgetStartAnimation.value==startDoubleValue?value:vvv:null,
                  // right:i==1?userWidgetStartAnimation.value==startDoubleValue?value:vvv:null,
                  // bottom:i==2?userWidgetStartAnimation.value==startDoubleValue?value:vvv:null,
                  // top: i==3?userWidgetStartAnimation.value==startDoubleValue?value:vvv:null,
                  left:userWidgetStartAnimation.value!=startDoubleValue?i==0?a:null:i==0?value:null,
                  right:userWidgetStartAnimation.value!=startDoubleValue?i==1?a:null:i==1?value:null,
                  bottom:userWidgetStartAnimation.value!=startDoubleValue?i==2?a:null:i==2?value:null,
                  top:userWidgetStartAnimation.value!=startDoubleValue?i==3?a:null: i==3?value:null,
                  // left:i==0?value:null,
                  // right:i==1?value:null,
                  // bottom:i==2?value:null,
                  // top: i==3?value:null,

                  child: Hero(
                    tag: 'hero$i',
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(MyImages.go1,height: 80,width: 80,),
                        Material(color: Colors.transparent,child: ParagraphText('${gameUserModal.userName}',color: Colors.white,fontWeight: FontWeight.w600,))

                      ],
                    ),
                  ),
                );
              }
          );
        }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    userWidgetAnimate();
    initializeAnimation();
    addAllParticipants();


    // startAnimation();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.stop();
    userWidgetStartAnimationController.dispose();
    userWidgetStartAnimation.removeListener(() { });
    _controller.dispose();
    margin.dispose();

    parentController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('the marding is ${margin.value}');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appbar1(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(MyImages.bglogo,)
                  )
              ),
              child:Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 400,
                width: 400,
                child: ScaleTransition(
                  scale: Tween(begin: 0.6, end: 1.0)
                      .animate(CurvedAnimation(
                      parent: parentController,
                      curve: Curves.easeOutCirc,
                  )
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Image.asset(MyImages.spinner,height: value,width: value,),
                      // Image.asset(MyImages.spinner2,height: value-100,width: value-100,),
                      // Image.asset(MyImages.spinner1,height: value-190,width: value-190,),
                      Image.asset(MyImages.spinner,height: 400,width: 400,),
                      Image.asset(MyImages.spinner2,height: 295,width: 295,),
                      Image.asset(MyImages.spinner1,height: 213,width: 213,),
                    ],
                  ),
                ),
                // child: ValueListenableBuilder(
                //   valueListenable: backSpinnnerSize,
                //   builder: (context, value, child) {
                //     return Stack(
                //       alignment: Alignment.center,
                //       children: [
                //         Image.asset(MyImages.spinner,height: value,width: value,),
                //         Image.asset(MyImages.spinner2,height: value-100,width: value-100,),
                //         Image.asset(MyImages.spinner1,height: value-190,width: value-190,),
                //         // Image.asset(MyImages.spinner,height: 400,width: 400,),
                //         // Image.asset(MyImages.spinner2,height: 295,width: 295,),
                //         // Image.asset(MyImages.spinner1,height: 213,width: 213,),
                //       ],
                //     );
                //   }
                // ),
              ),
            // LogoRotate(),
          ),
          Positioned(
            // left: 0,right: 0,top: 0,bottom: 0,
            child: Container(
              height: 400,width: 400,
              // color: Colors.blue.withOpacity(0.1),
              child: RotationTransition(
                turns: _animation,alignment: Alignment.center,

                // child: ,
                child: Container(
                  child: ValueListenableBuilder(
                      valueListenable: opacity,
                      builder: (context, opacityValue, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 400,
                            width: 400,
                            // color: Colors.green.withOpacity(0.4),
                          ),
                          Positioned(
                            left: 0,right: 0,top: 0,bottom: 0,

                            child: Center(
                              child: AnimatedOpacity(
                                opacity: opacityValue,
                                duration: Duration(milliseconds: 400),
                                child: GestureDetector(
                                  onTap: (){
                                    opacity.value=0;
                                    startAnimation();
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(MyImages.go1,height: 100,width: 100,),
                                      ParagraphText('GO',color: Colors.white,fontWeight: FontWeight.w900,fontSize: 34,)

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ...participants,
                        ],
                      );
                    }
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
