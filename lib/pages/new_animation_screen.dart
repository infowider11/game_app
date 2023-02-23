import 'package:flutter/material.dart';

import '../constants/images_url.dart';
import '../widgets/CustomTexts.dart';

class NewAnimationScreen extends StatefulWidget {
  const NewAnimationScreen({Key? key}) : super(key: key);

  @override
  State<NewAnimationScreen> createState() => _NewAnimationScreenState();
}

class _NewAnimationScreenState extends State<NewAnimationScreen> with TickerProviderStateMixin{


  late AnimationController _controller;
  late AnimationController parentController;
  late Animation<double> _animation;
  double padding = 10;
  int seconds = 3;

  static ValueNotifier<double> margin = ValueNotifier(10);





  // ValueNotifier<double> backSpinnnerSize = ValueNotifier(230);






  startAnimation()async{
    participants.shuffle();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: seconds),
        animationBehavior: AnimationBehavior.preserve
    )
      ..repeat()
    ;



    _animation = Tween<double>(begin: 0, end: 5).animate(_controller)
      ..addListener(() {
        setState(() {
          padding =10+ _animation.value * 5;
          margin.value = 10+ _animation.value * 36;
          print('...the magin is ${_animation.value} now ${margin.value} amd size is ${(MediaQuery.of(context).size.width/2)}');
          if(margin.value>=(MediaQuery.of(context).size.width/2)-40){
            print('the magin is now ${margin.value} amd size is ${(MediaQuery.of(context).size.width/2)}');
            _controller.stop();
          }
          // print('the backspinner  dd value is ${backSpinnnerSize.value} annn ${_animation.value} ..${backSpinnnerSize.value>=400}');
          // backSpinnnerSize.value = backSpinnnerSize.value + (backSpinnnerSize.value>=400?(-((_animation.value * 10)%15)):(_animation.value * 10)%15);
          // print('the backspinner value is ${backSpinnnerSize.value}');

        });
      });

    // Future.delayed(Duration(milliseconds: (seconds*1000)+974)).then((value){
    //   // _controller.stop();
    //   // _controller.d
    // });

    parentController = AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    parentController.repeat(reverse: true);

    Future.delayed(Duration(seconds: 10)).then((value){
      parentController.stop();
    });
  }

  List<Widget> participants = [
    ValueListenableBuilder<double>(
        valueListenable: margin,
        builder: (context, value,child) {
          return Positioned(
            right:value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(MyImages.go1,height: 80,width: 80,),
                ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)

              ],
            ),
          );
        }
    ),
    ValueListenableBuilder<double>(
        valueListenable: margin,
        builder: (context, value,child) {
          return Positioned(
            left:value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(MyImages.go1,height: 80,width: 80,),
                ParagraphText('Manish',color: Colors.white,fontWeight: FontWeight.w600,)

              ],
            ),
          );
        }
    ),
  ];
  @override
  void initState() {
    super.initState();
    startAnimation();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
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
                  scale: Tween(begin: 0.5, end: 1.0)
                      .animate(CurvedAnimation(
                      parent: parentController,
                      curve: Curves.elasticOut,
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 400,
                        width: 400,
                        // color: Colors.green.withOpacity(0.4),
                      ),
                      ...participants,
                    ],
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
