import 'package:flutter/material.dart';
import 'package:gameapp/services/local_services.dart';

import '../constants/colors.dart';
import '../constants/sized_box.dart';
import 'CustomTexts.dart';


AppBar appBar(
    {String? title,
    bool showLogoutButton = false,
    bool implyLeading = true,
    Function()? onBackButtonTap,
      PreferredSizeWidget? bottom,
    required BuildContext context,
    List<Widget>? actions}) {
  return AppBar(
    toolbarHeight: 70,
    automaticallyImplyLeading: false,
    titleSpacing: implyLeading ? 0 : 16,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    bottom: bottom,
    title: title == null
        ? null
        : AppBarHeadingText(
            text: title,
            fontSize:22,
            fontFamily: 'PlayfairDisplayMedium',
      color: Color(0xff000000),
          ),
    leading: implyLeading
        ? IconButton(
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: onBackButtonTap != null
                ? onBackButtonTap
                : () {
                    Navigator.pop(context);
                  },
          )
        : null,
    actions: showLogoutButton
        ? [
            hSizedBox,
            Center(
              child: GestureDetector(
                onTap: ()async{
                  await MyLocalServices.logout();
                  // await logout();
                  //
                  // Navigator.popUntil(context, (route) => route.isFirst);
                  // Navigator.pushReplacementNamed(context, ChooseCustomerOrMinistryPage.id);

                },
                child: Text(
                  'logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            hSizedBox,
          ]
        : actions,
  );



}

AppBar appbar1( {String? title, Function()? onTap}){
  return AppBar(
    leading: GestureDetector(
      onTap:onTap ,
        child: Icon(Icons.menu_outlined)),
    title: title!=null?Text(title): ValueListenableBuilder(
        valueListenable: userDataNotifier,
        builder: (context, userData, child) {
        return Text(userData!.fullName);
      }
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
  );
}

