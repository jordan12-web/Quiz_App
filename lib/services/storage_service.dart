import 'dart:convert';
import 'package:quizapp/models/category.dart';
import 'package:quizapp/models/sample_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String categoriesKey = 'smartquiz-categories';
  static const String usersKey = 'smartquiz-users';

  //Saving Categories
Future<void> saveCategories(List<Category> categories) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = categories.map((c)=> jsonEncode(c.toMap)).toList();
  await prefs.setStringList(categoriesKey, jsonList);
}


             //Retriving Categories
Future<List<Category>> loadCategory() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = await prefs.getStringList(categoriesKey);
  if(jsonList == null){
   await saveCategories(sampleCategories);
   return sampleCategories;
  }
  return jsonList.map((json)=> Category.fromMap(jsonDecode(json))).toList();
}
    
    //Loading Users
Future<void> saveUsers(List<Map<String,String>> users) async{
final prefs = await SharedPreferences.getInstance();
final jsonList = users.map((u)=> jsonEncode(u)).toList();
await prefs.setStringList(usersKey, jsonList);

}

Future<List<Map<String,String>>> loadUser() async{
  final prefs = await SharedPreferences.getInstance();
  final jsonList = await prefs.getStringList(usersKey);
  if(jsonList == null){
    return [];
    
  }
  return jsonList.map((json)=> Map<String,String>.from(jsonDecode(json))).toList();
}
}