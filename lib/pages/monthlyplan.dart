import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/widgets/CustomTexts.dart';
import 'package:gameapp/widgets/card.dart';
import 'package:gameapp/widgets/round_edged_button.dart';

import '../constants/global_data.dart';
import '../widgets/appbar.dart';

class MonthlyPlan extends StatefulWidget {
  const MonthlyPlan({Key? key}) : super(key: key);

  @override
  State<MonthlyPlan> createState() => _MonthlyPlanState();
}

class _MonthlyPlanState extends State<MonthlyPlan> {
  bool value = false;
  bool isChecked = false;

  void checkboxCallBack(bool? checkboxState) {
    setState(() {
      print('vxbb');
      for(int i=0;i<payment.length;i++)
      payment[i]['isChecked']= checkboxState ?? true;
      // isChecked = checkboxState ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool check=false;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
              )),
          title: Text('Monthly Plan'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
            itemCount: payment.length,
            itemBuilder: (BuildContext context, int index) {
              return MonthlyPlanCard(isChecked:isChecked,checkboxCallBack:(bool? checkboxState) {
                setState(() {payment[index]['isChecked']= checkboxState ?? true;});
              },index:payment[index]);
            }),
        bottomNavigationBar:
      GestureDetector(
        onTap: (){
          showDialog(
            context: context,
            builder: (ctx) => Dialog(
                insetPadding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child:Container(
                  height: 465,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vSizedBox2,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              ParagraphText('Make Payment',fontWeight: FontWeight.w600,fontSize: 16,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Icon((Icons.cancel_outlined))),


                            ],
                          ),
                        ),
                        vSizedBox05,
                        Image.asset(MyImages.card,height: 41,width: 136,),
                        vSizedBox05,
                        Image.asset(MyImages.strip),
                      ],
                    ),
                  ),
                )
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundEdgedButton(text: 'Pay',fontSize: 20,borderRadius:10,color:MyColors.primaryColor,textColor: MyColors.whiteColor,),
        ),
      ),
    );

  }
}
