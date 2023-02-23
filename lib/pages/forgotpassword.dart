import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/widgets/custom_text_field.dart';
import 'package:gameapp/widgets/round_edged_button.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email=TextEditingController();
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
        title: Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              MyImages.bglogo
            )
          )

        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              vSizedBox2,
              CustomTextField(
                controller: email,
                hintcolor: Colors.white,
                textColor: Colors.white,

                hintText: ' Enter Email Address',
                bgColor:Colors.transparent,
                borderRadius: 8,
                obscureText: true,
              ),
              vSizedBox2,
              RoundEdgedButton(text: 'Submit',color:MyColors.primaryColor,borderRadius: 8,fontSize: 20,onTap: (){
                Navigator.pop(context);
              },)
            ],
          ),
        ),
      ),

    );
  }
}
