import 'package:flutter/cupertino.dart';
import 'package:gameapp/modals/game_level_modal.dart';

Map<String, String> globalHeaders ={
  'Accept':'application/json',
  // 'Authorization': 'Bearer  kgfklgfklagkljas'
};


enum Gender{
  male, female
}

enum QuestionType{
  truth,dare
}
List globalLanguagesList = ['English','Spanish', 'Portuguese'];
ValueNotifier<String> selectedLanguage = ValueNotifier(globalLanguagesList[0]);


List<GameLevelModal> gameLevels = [];
ValueNotifier<GameLevelModal?> selectedGameLevel = ValueNotifier(null);
ValueNotifier<Map?> questionData = ValueNotifier(null);
// List gameLevelsList = [];

String userToken = '';
List payment=[
   {
     'isChecked':true,
    'title': '\$8 monthly',
    'subtitle': 'User will be to access all the game levels of the couple version'
  },
   {
     'isChecked':false,
     'title': '\$12 monthly',
     'subtitle': 'Group version in all levels, for free they will only play the friendship part as a demo'
   }
];
