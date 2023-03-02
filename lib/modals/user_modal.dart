

import 'package:gameapp/constants/global_data.dart';

class UserModal {
  int userId;
  String firstName;
  String lastName;
  String emailId;
  String gender;
  String token;
  String fullName;
  Map fullData;
  String gameId;

  UserModal({
    required this.userId,
    required this.emailId,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.fullData,
    required this.fullName,
    required this.gameId,

  });

  factory UserModal.fromJson(Map userMap) {
    print('Creating user modal with experiment = ${(userMap['is_any_active_experiment']??'0').toString()=='0'} and id ${userMap['is_any_active_experiment']}');
    String fullName = userMap['first_name'];
    if(userMap['last_name']!=''){
      fullName +=' ' +userMap['last_name'];
    }
    return UserModal(
      userId: userMap['id']??'0',
      firstName: userMap['first_name']??'',
      lastName: userMap['last_name']??'',
      emailId: userMap['email'],
      gender: userMap['gender']??'Male',
      token: userMap['token']??userToken,
      fullData: userMap,
        gameId: userMap['unique_id']??userMap['id']??'0',
      fullName:fullName

    );
  }
}


