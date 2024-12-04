import 'dart:convert';

import 'package:awasthy/core/constant/constant.dart';
import 'package:awasthy/model/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  List<UserModel> Users = [];
  bool isLoading = false;
  int CurrCardIndex = -1;
  var button1 = true;
  var button2 = false;
  var button3 = false;
  var button4 = false;
  void setCardIndex(int index) {
    CurrCardIndex = index;
    notifyListeners();
  }

  int getCurrCardIndex() {
    return CurrCardIndex;
  }

  void Back(BuildContext context) {
    Navigator.pop(context);
    notifyListeners();
  }

  void SelectButton1() {
    button1 = true;
    button2 = false;
    button3 = false;
    button4 = false;
    notifyListeners();
  }

  void SelectButton2() {
    button2 = true;
    button1 = false;
    button3 = false;
    button4 = false;
    notifyListeners();
  }

  void SelectButton3() {
    button3 = true;
    button2 = false;
    button1 = false;
    button4 = false;
    notifyListeners();
  }

  void SelectButton4() {
    button4 = true;
    button1 = false;
    button2 = false;
    button3 = false;
    notifyListeners();
  }

  Future<void> FetchUsers() async {
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        /*for (var i in data) {
          Users.add(UserModel.fromJson(i));
        }*/
        Users = data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        print("${response.statusCode} User Fetch Unseccesful");
      }
    } catch (e) {
      print("${e.toString()}");
    } finally {
      isLoading = true;
      notifyListeners();
    }
  }
}
