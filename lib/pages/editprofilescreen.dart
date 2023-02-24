import 'package:flutter/material.dart';
import 'package:gameapp/constants/colors.dart';
import 'package:gameapp/constants/images_url.dart';
import 'package:gameapp/services/local_services.dart';
import 'package:gameapp/widgets/custom_text_field.dart';
import 'package:gameapp/widgets/dropdown.dart';
import '../constants/global_keys.dart';
import '../functions/navigation_functions.dart';
import '../functions/validators.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';
import '../widgets/round_edged_button.dart';

import '../constants/sized_box.dart';
import 'homescreen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? gender;
  ValueNotifier<bool> pageLoad = ValueNotifier(false);

  initializeData() async {
    firstNameController.text = userDataNotifier.value!.firstName;
    lastNameController.text = userDataNotifier.value!.lastName;
    gender = userDataNotifier.value!.gender;
    emailController.text = userDataNotifier.value!.emailId;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeData();
    super.initState();
  }

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
        title: Text('Edit Profile'),
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
              controller: firstNameController,
              hintText: 'First Name',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor: Colors.transparent,
              fontsize: 15,
              borderRadius: 10,
              keyboardType: TextInputType.emailAddress,
            ),
            // vSizedBox2,
            CustomTextField(
              controller: lastNameController,
              hintText: 'Last Name',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor: Colors.transparent,
              fontsize: 15,
              borderRadius: 10,
              keyboardType: TextInputType.emailAddress,
            ),
            DropDwon(
              items: ['Male', 'Female'],
              selectedValue: gender,
              onChanged: (val) {
                print('the val is ${val}');
                gender = val;
                setState(() {});
              },
            ),
            vSizedBox05,
            CustomTextField(
              controller: emailController,
              hintText: 'Enter Email',
              hintcolor: Colors.white,
              textColor: Colors.white,
              bgColor: Colors.transparent,
              fontsize: 15,
              borderRadius: 10,
              keyboardType: TextInputType.emailAddress,
              enabled: false,
            ),

            vSizedBox2,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child:ValueListenableBuilder(
            valueListenable: pageLoad,
            builder: (context, pageLoadValue,child,) {
            return RoundEdgedButton(
              text: 'SAVE',
              fontSize: 20,
              borderRadius: 10,
              color: MyColors.primaryColor,
              load: pageLoadValue,
              textColor: MyColors.whiteColor,
              onTap: () async{
                print('the data is ${gender}');
                if (MyValidators.isStringInvalid(firstNameController.text, 'Please enter your first name.') ||
                    MyValidators.isStringInvalid(lastNameController.text, 'Please enter your last name.') ||
                    MyValidators.isStringInvalid(gender, 'Please select your gender.')

                ) {}
                else {
                  print('I am here');
                  pageLoad.value=true;
                  var request = {
                    'first_name':firstNameController.text,
                    'last_name':lastNameController.text,
                    'gender':gender,
                    'email': emailController.text,
                  };
                  var jsonResponse = await Webservices.postData(apiUrl: ApiUrls.editProfile, request: request, showSuccessMessage: true);
                  if(jsonResponse['status']==1){
                    MyLocalServices.updateSharedPreferences(jsonResponse['data']);
                // pageLoad.value=false;

                }else{
                // await Future.delayed(Duration(seconds: 10));

                }
                  pageLoad.value=false;
              }
              },
            );
          }
        ),
      ),
    );
  }
}
