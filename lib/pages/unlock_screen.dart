import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/navigation_functions.dart';
import 'package:gameapp/pages/homescreen.dart';
import 'package:gameapp/pages/monthlyplan.dart';
import 'package:gameapp/widgets/drawer.dart';
import 'package:gameapp/widgets/round_edged_button.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/appbar.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({Key? key}) : super(key: key);

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> with TickerProviderStateMixin{

  var scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        key: scaffoldKey,
        drawer: get_drawer(context,scaffoldKey),
        appBar: appbar1(title: 'Uploaded',onTap: (){scaffoldKey.currentState?.openDrawer();}),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height/1.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(MyImages.bglogo,)
                    )
                ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParagraphText('Uploaded/Seduction things up!',fontWeight: FontWeight.w600,fontSize: 16, color: MyColors.whiteColor, ),

                vSizedBox2,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                        height: MediaQuery.of(context).size.height/2.8,
                        child: Image.asset(MyImages.unlock, fit: BoxFit.cover,))
                ),
                vSizedBox4,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: RoundEdgedButton(text: 'Unlock',fontSize: 20,borderRadius:10,color:MyColors.primaryColor,textColor: MyColors.whiteColor,
                  onTap: ()=> push(context: context, screen: MonthlyPlan()),
                  ),
                ),
              ],
            ),



          ],
        ),
      bottomNavigationBar: Container(
          height: 70,
          alignment: Alignment.center,
          child: InkWell(
              onTap: ()=> push(context: context, screen: HomeScreen()),
              child: ParagraphText('Back to previous level',fontWeight: FontWeight.w500,fontSize: 15, color: MyColors.whiteColor, underlined:true , ))),
    );
  }
}
