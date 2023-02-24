import 'package:flutter/material.dart';
import 'package:gameapp/constants/sized_box.dart';
import 'package:gameapp/functions/validators.dart';
import 'package:gameapp/services/api_urls.dart';
import 'package:gameapp/services/webservices.dart';
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

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ValueNotifier<bool> pageLoad=ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
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
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(MyImages.bglogo))),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            vSizedBox2,
            CustomTextField(
              controller: passwordController,
              hintText: 'Current Password',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor: Colors.transparent,
              obscureText: true,
              fontsize: 15,
              borderRadius: 10,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: newPasswordController,
              hintText: 'New Password',
              hintcolor: Colors.white,
              obscureText: true,
              textColor: Colors.white,
              bgColor: Colors.transparent,
              fontsize: 15,
              borderRadius: 10,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              hintcolor: Colors.white,
              obscureText: true,
              textColor: Colors.white,
              bgColor: Colors.transparent,
              fontsize: 15,
              borderRadius: 10,
              keyboardType: TextInputType.emailAddress,
            ),
            vSizedBox2,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
            valueListenable: pageLoad,
            builder: (
              context,
              pageLoadValue,
              child,
            ) {
              return RoundEdgedButton(
                text: 'SAVE',
                fontSize: 20,
                borderRadius: 10,
                load: pageLoadValue,
                color: MyColors.primaryColor,
                textColor: MyColors.whiteColor,
                onTap: ()async{

                  if(
                  MyValidators.isPasswordInvalid(passwordController.text)||
                      MyValidators.isPasswordInvalid(newPasswordController.text)||
                      MyValidators.isPasswordInvalid(confirmPasswordController.text)||
                      MyValidators.isPasswordMatched(newPasswordController.text, confirmPasswordController.text)
                  ){

                  }else{
                    pageLoad.value = true;
                    var request = {
                      'current_password':passwordController.text,
                      'new_password':newPasswordController.text,
                      'c_password':confirmPasswordController.text,
                    };
                    var jsonResponse = await Webservices.postData(apiUrl: ApiUrls.changePassword, request: request, showSuccessMessage: true);
                    if(jsonResponse['status']==1){
                      passwordController.clear();
                      newPasswordController.clear();
                      confirmPasswordController.clear();
                    }
                    pageLoad.value = false;
                  }
                },
              );
            }),
      ),
    );
  }
}
