import 'package:flutter/material.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';

import '../widgets/dropdown.dart';
class TrasactionHistory extends StatefulWidget {
  const TrasactionHistory({Key? key}) : super(key: key);

  @override
  State<TrasactionHistory> createState() => _TrasactionHistoryState();
}

class _TrasactionHistoryState extends State<TrasactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        leading: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
        title: Text('Transaction History'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImages.bglogo)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox2,
              DropDwon(
                items: ['Sort by month','Sort by date'],
              ),
              vSizedBox2,
              for(int i=0;i<5;i++)
              Container(
                margin: EdgeInsets.symmetric(vertical:5),
                child: RichText(text: TextSpan(
                    text: '\$50 for  ',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Regular'),
                    children: [
                      TextSpan(
                          text: 'MILD/FRIENDSHIP',style: TextStyle(fontSize: 14,fontFamily: 'Regular',color: Color(0xffE52F69))
                      ),
                      TextSpan(
                          text: ' on 07 feb 2023',style: TextStyle(fontSize: 14,fontFamily: 'Regular',color: Colors.white)
                      ),
                    ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
