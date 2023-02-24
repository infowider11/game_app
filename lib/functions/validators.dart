

import '../widgets/showSnackbar.dart';

class MyValidators{
  static bool isEmailInvalid(String email){

    if(email==''){
      showSnackbar('Email field cannot be empty!');
      return true;
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)){
      showSnackbar('Please type a valid email address');
      return true;
    }
    return false;
  }


  static bool isPasswordInvalid(String password, { bool strongPassword = false, int length = 6}){

    if(password==''){
      showSnackbar('Password field is required!');
      return true;
    }else if(password.length<length){
      showSnackbar('Password should have at least $length characters.');
      return true;
    }else{
      return false;
    }

  }
  static bool isPasswordMatched(String password,String cpassword, { bool strongPassword = false}){

    if(password!=cpassword){
      showSnackbar('Password and confirm password should be same.');
      return true;
    }else{
      return false;
    }

  }

  static bool isPhoneNumberInvalid(String phoneNumber, { bool strongValidation = false}){

    if(phoneNumber==''){
      showSnackbar('Phone Number Field is required!');
      return true;
    }else if(phoneNumber.length<8){
      showSnackbar('Please Type A Valid Phone Number');
      return true;
    }else{
      return false;
    }

  }

  static bool isStringInvalid(String? text, String errorMessage){

    if(text=='' || text==null){
      showSnackbar(errorMessage);
      return true;
    }else{
      return false;
    }

  }



}