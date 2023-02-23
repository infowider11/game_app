import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/widgets/custom_text_field.dart';
import 'package:gameapp/widgets/dropdown.dart';
import '../widgets/round_edged_button.dart';


import '../constants/sized_box.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController fname=TextEditingController();
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
        title: Text('Edit Profile'),
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
              controller: fname,
              hintText: 'Full Name',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor:Colors.transparent,
              fontsize: 15,
              borderRadius:10,
              keyboardType: TextInputType.emailAddress,
            ),
            vSizedBox05,
            CustomTextField(
              controller: phone,
              hintText: 'Phone Number',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor:Colors.transparent,
              fontsize: 15,
              borderRadius:10,
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              controller: email,
              hintText: 'Email Address',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor:Colors.transparent,
              fontsize: 15,
              borderRadius:10,
              keyboardType: TextInputType.emailAddress,
            ),

            // CustomTextField(
            //   controller: password,
            //   hintText: 'Password',
            //   hintcolor: Colors.white,
            //   textColor: Colors.white,
            //   bgColor:Colors.transparent,
            //   fontsize: 15,
            //   borderRadius:10,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            // CustomTextField(
            //   controller: cpassword,
            //   hintcolor: Colors.white,
            //   textColor: Colors.white,
            //
            //   hintText: 'Confirm Password',
            //   bgColor:Colors.transparent,
            //   borderRadius: 8,
            //   obscureText: true,
            // ),
            DropDwon(
              items: ['Male','Female'],
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
