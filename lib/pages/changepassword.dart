import 'package:flutter/material.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/widgets/custom_text_field.dart';

import '../constants/colors.dart';
import '../constants/images_url.dart';
import '../widgets/round_edged_button.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController npassword=TextEditingController();
  TextEditingController password=TextEditingController();

  TextEditingController cpassword=TextEditingController();
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
        title: Text('Change Password'),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            vSizedBox2,
            CustomTextField(
              controller: password,
              hintText: 'Current Password',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor:Colors.transparent,
              obscureText: true,
              fontsize: 15,
              borderRadius:10,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: npassword,
              hintText: 'New Password',
              hintcolor: Colors.white,
              obscureText: true,
              textColor: Colors.white,
              bgColor:Colors.transparent,
              fontsize: 15,
              borderRadius:10,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: cpassword,
              hintText: 'Confirm Password',
              hintcolor: Colors.white,
              obscureText: true,
              textColor: Colors.white,
              bgColor:Colors.transparent,
              fontsize: 15,
              borderRadius:10,
              keyboardType: TextInputType.emailAddress,
            ),


            vSizedBox2,
          ],
        ),
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundEdgedButton(text: 'SAVE',fontSize: 20,borderRadius:10,color:MyColors.primaryColor,textColor: MyColors.whiteColor,),
      ),

    );

  }
}
