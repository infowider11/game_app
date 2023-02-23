//
//
//
//
// import '../constants/global_data.dart';
//
// class UserModal {
//   String userId;
//   String name;
//   String emailId;
//   String gender;
//   String city;
//   String country;
//   String phone;
//   UserType userType;
//
//   UserModal({
//     required this.userId,
//     required this.emailId,
//     required this.gender,
//     required this.city,
//     required this.country,
//     required this.phone,
//     required this.name,
//     required this.userType,
//
//   });
//
//   factory UserModal.fromJson(Map userData) {
//     print('Creating user modal with experiment = ${(userData['is_any_active_experiment']??'0').toString()=='0'} and id ${userData['is_any_active_experiment']}');
//     return UserModal(
//       userId: userData['id']??'0',
//       name: userData['name'],
//       emailId: userData['email'],
//       gender: userData['gender'],
//       city: userData['city'],
//       country: userData['country'],
//       phone: userData['phone'],
//       userType: UserType.Cleaners
//
//     );
//   }
// }
//
//
