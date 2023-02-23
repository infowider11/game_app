import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/pages/matchedscreen.dart';
import 'package:gameapp/pages/questionscreen.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/drawer.dart';

import '../widgets/appbar.dart';

// import '../widgets/animation.dart';
class MatchingScreen extends StatefulWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> with TickerProviderStateMixin{

  var scaffoldKey = GlobalKey<ScaffoldState>();
  double _radius = 0.0;
  double _angle = 0.0;
  late  AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds:1000),
    vsync: this,)..repeat(reverse: false);
  late  Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
    // elasticOut
  )..addListener(() {
    setState(() {
      _radius = _animation.value * 20;
      _angle = _animation.value * 4;
    });
  });
  int show=1;

  callBack(){
    Future.delayed(Duration(seconds: 3),() async{
       push(context: context, screen: MatchedScreen()).then((value){

         Future.delayed(Duration(seconds:1)).then((value)  {
           show=1;
           setState(() {});
           print(show);
         });
         Future.delayed(Duration(seconds:2)).then((value)  {
           show=2;
           setState(() {});
           print(show);
         });

         Future.delayed(Duration(seconds:3)).then((value)  {
           show=4;
           setState(() {});
           _controller.stop();

           print(show);
         });
         callBack();
       });
       _controller.dispose();
       _controller = AnimationController(
        duration: const Duration(milliseconds:1000),
        vsync: this,)..repeat(reverse: false);
       _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.linearToEaseOut,
        // elasticOut
      );
       show=1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds:1)).then((value)  {
      show=1;
      setState(() {});
      print(show);
    });
    Future.delayed(Duration(seconds:2)).then((value)  {
      show=2;
      setState(() {});
      print(show);
    });
    // Future.delayed(Duration(seconds:3)).then((value)  {
    //   show=3;
    //   setState(() {});
    //   print(show);
    // });
    Future.delayed(Duration(seconds:3)).then((value)  {
      show=4;
      setState(() {});
      _controller.stop();

      print(show);
    });
    callBack();
    ///
    // Future.delayed(Duration(seconds:5)).then((value)  {
    //   show=5;
    //   setState(() {});
    //   print(show);
    // });
    // Future.delayed(Duration(seconds:6)).then((value)  {
    //   show=6;
    //   setState(() {});
    //   print(show);
    // });
    // Future.delayed(Duration(seconds:7)).then((value)  {
    //   show=7;
    //   setState(() {});
    //   print(show);
    //   _controller.stop();
    // });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        key: scaffoldKey,
        drawer: get_drawer(context,),
        appBar: appbar1('John Smith',(){scaffoldKey.currentState?.openDrawer();}),
        body:show==1? Stack(
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
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(MyImages.spinner,height: 400,width: 400,),
                    Image.asset(MyImages.spinner2,height: 295,width: 295,),
                    Image.asset(MyImages.spinner1,height: 213,width: 213,),
                  ],
                ),
              )
            // LogoRotate(),
          ),
          RotationTransition(
            turns: _animation,
            child: Container(
              width:MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left:20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(MyImages.go1,height: 80,width: 80,),
                        ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
                      ],
                    ),
                  ),
                  hSizedBox4,
                  GestureDetector(
                    onTap: (){
                      // push(context: context, screen: MatchedScreen());
                    },
                    child: Container(
                      height: 105,width: 105,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.primaryColor,
                          border: Border.all(color: Color(0xffCE1C55),width:6)
                      ),
                      child: Center(
                        child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
                      ),
                    ),
                  ),
                  hSizedBox4,
                  Positioned(
                    right:20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(MyImages.go1,height: 80,width: 80,),
                        ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ):
        show==2? Stack(
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
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(MyImages.spinner,height: 400,width: 400,),
                      Image.asset(MyImages.spinner2,height: 295,width: 295,),
                      Image.asset(MyImages.spinner1,height: 213,width: 213,),
                    ],
                  ),
                )
              // LogoRotate(),
            ),
            RotationTransition(
              turns: _animation,
              child: Container(
                width:MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left:40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(MyImages.go1,height: 80,width: 80,),
                          ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
                        ],
                      ),
                    ),
                    hSizedBox4,
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: MatchedScreen());
                      },
                      child: Container(
                        height: 105,width: 105,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.primaryColor,
                            border: Border.all(color: Color(0xffCE1C55),width:6)
                        ),
                        child: Center(
                          child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ),
                    hSizedBox4,
                    Positioned(
                      right:40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(MyImages.go1,height: 80,width: 80,),
                          ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ):
        // show==3?Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Container(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(MyImages.bglogo,)
        //             )
        //         ),
        //         child:Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 8),
        //           child: Stack(
        //             alignment: Alignment.center,
        //             children: [
        //               Image.asset(MyImages.spinner,height: 400,width: 400,),
        //               Image.asset(MyImages.spinner2,height: 295,width: 295,),
        //               Image.asset(MyImages.spinner1,height: 213,width: 213,),
        //             ],
        //           ),
        //         )
        //       // LogoRotate(),
        //     ),
        //     RotationTransition(
        //       turns: _animation,
        //       child: Container(
        //         width:MediaQuery.of(context).size.width,
        //         child: Stack(
        //           alignment: Alignment.center,
        //           children: [
        //             Positioned(
        //               left:80,
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.go1,height: 80,width: 80,),
        //                   ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
        //                 ],
        //               ),
        //             ),
        //             hSizedBox4,
        //             GestureDetector(
        //               onTap: (){
        //                 push(context: context, screen: MatchedScreen());
        //               },
        //               child: Container(
        //                 height: 105,width: 105,
        //                 decoration: BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color: MyColors.primaryColor,
        //                     border: Border.all(color: Color(0xffCE1C55),width:6)
        //                 ),
        //                 child: Center(
        //                   child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
        //                 ),
        //               ),
        //             ),
        //             hSizedBox4,
        //             Positioned(
        //               right:80,
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.go1,height: 80,width: 80,),
        //                   ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)
        //
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ):
        show==4? Stack(
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
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(MyImages.spinner,height: 400,width: 400,),
                      Image.asset(MyImages.spinner2,height: 295,width: 295,),
                      Image.asset(MyImages.spinner1,height: 213,width: 213,),
                    ],
                  ),
                )
              // LogoRotate(),
            ),
            RotationTransition(
              turns: _animation,
              child: Container(
                width:MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left:140,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(MyImages.go1,height: 80,width: 80,),
                          ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
                        ],
                      ),
                    ),
                    hSizedBox4,
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: MatchedScreen());
                      },
                      child: Container(
                        height: 105,width: 105,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.primaryColor,
                            border: Border.all(color: Color(0xffCE1C55),width:6)
                        ),
                        child: Center(
                          child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ),
                    hSizedBox4,
                    Positioned(
                      right:140,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(MyImages.go1,height: 80,width: 80,),
                          ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ):
        // show==5? Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         Container(
        //             height: MediaQuery.of(context).size.height,
        //             width: MediaQuery.of(context).size.width,
        //             decoration: BoxDecoration(
        //                 image: DecorationImage(
        //                     image: AssetImage(MyImages.bglogo,)
        //                 )
        //             ),
        //             child:Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 8),
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.spinner,height: 400,width: 400,),
        //                   Image.asset(MyImages.spinner2,height: 295,width: 295,),
        //                   Image.asset(MyImages.spinner1,height: 213,width: 213,),
        //                 ],
        //               ),
        //             )
        //           // LogoRotate(),
        //         ),
        //         RotationTransition(
        //           turns: _animation,
        //           child: Container(
        //             width:MediaQuery.of(context).size.width,
        //             child: Stack(
        //               alignment: Alignment.center,
        //               children: [
        //                 Positioned(
        //                   left:100,
        //                   child: Stack(
        //                     alignment: Alignment.center,
        //                     children: [
        //                       Image.asset(MyImages.go1,height: 80,width: 80,),
        //                       ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
        //                     ],
        //                   ),
        //                 ),
        //                 hSizedBox4,
        //                 GestureDetector(
        //                   onTap: (){
        //                     push(context: context, screen: MatchedScreen());
        //                   },
        //                   child: Container(
        //                     height: 105,width: 105,
        //                     decoration: BoxDecoration(
        //                         shape: BoxShape.circle,
        //                         color: MyColors.primaryColor,
        //                         border: Border.all(color: Color(0xffCE1C55),width:6)
        //                     ),
        //                     child: Center(
        //                       child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
        //                     ),
        //                   ),
        //                 ),
        //                 hSizedBox4,
        //                 Positioned(
        //                   right:100,
        //                   child: Stack(
        //                     alignment: Alignment.center,
        //                     children: [
        //                       Image.asset(MyImages.go1,height: 80,width: 80,),
        //                       ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)
        //
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ):
        // show==6? Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Container(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(MyImages.bglogo,)
        //             )
        //         ),
        //         child:Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 8),
        //           child: Stack(
        //             alignment: Alignment.center,
        //             children: [
        //               Image.asset(MyImages.spinner,height: 400,width: 400,),
        //               Image.asset(MyImages.spinner2,height: 295,width: 295,),
        //               Image.asset(MyImages.spinner1,height: 213,width: 213,),
        //             ],
        //           ),
        //         )
        //       // LogoRotate(),
        //     ),
        //     RotationTransition(
        //       turns: _animation,
        //       child: Container(
        //         width:MediaQuery.of(context).size.width,
        //         child: Stack(
        //           alignment: Alignment.center,
        //           children: [
        //             Positioned(
        //               left:120,
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.go1,height: 80,width: 80,),
        //                   ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
        //                 ],
        //               ),
        //             ),
        //             hSizedBox4,
        //             GestureDetector(
        //               onTap: (){
        //                 push(context: context, screen: MatchedScreen());
        //               },
        //               child: Container(
        //                 height: 105,width: 105,
        //                 decoration: BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color: MyColors.primaryColor,
        //                     border: Border.all(color: Color(0xffCE1C55),width:6)
        //                 ),
        //                 child: Center(
        //                   child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
        //                 ),
        //               ),
        //             ),
        //             hSizedBox4,
        //             Positioned(
        //               right:120,
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.go1,height: 80,width: 80,),
        //                   ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)
        //
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ):
        // show==7? Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Container(
        //         height: MediaQuery.of(context).size.height,
        //         width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(MyImages.bglogo,)
        //             )
        //         ),
        //         child:Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 8),
        //           child: Stack(
        //             alignment: Alignment.center,
        //             children: [
        //               Image.asset(MyImages.spinner,height: 400,width: 400,),
        //               Image.asset(MyImages.spinner2,height: 295,width: 295,),
        //               Image.asset(MyImages.spinner1,height: 213,width: 213,),
        //             ],
        //           ),
        //         )
        //       // LogoRotate(),
        //     ),
        //     RotationTransition(
        //       turns: _animation,
        //       child: Container(
        //         width:MediaQuery.of(context).size.width,
        //         child: Stack(
        //           alignment: Alignment.center,
        //           children: [
        //             Positioned(
        //               left:140,
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.go1,height: 80,width: 80,),
        //                   ParagraphText('John',color: Colors.white,fontWeight: FontWeight.w600,)
        //                 ],
        //               ),
        //             ),
        //             hSizedBox4,
        //             GestureDetector(
        //               onTap: (){
        //                 push(context: context, screen: MatchedScreen());
        //               },
        //               child: Container(
        //                 height: 105,width: 105,
        //                 decoration: BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color: MyColors.primaryColor,
        //                     border: Border.all(color: Color(0xffCE1C55),width:6)
        //                 ),
        //                 child: Center(
        //                   child: ParagraphText('GO',color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600,),
        //                 ),
        //               ),
        //             ),
        //             hSizedBox4,
        //             Positioned(
        //               right:140,
        //               child: Stack(
        //                 alignment: Alignment.center,
        //                 children: [
        //                   Image.asset(MyImages.go1,height: 80,width: 80,),
        //                   ParagraphText('Rubby',color: Colors.white,fontWeight: FontWeight.w600,)
        //
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ):
        null
    );
  }
}
