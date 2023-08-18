import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends ChangeNotifier  {
  String search = "";
  void add(String s){
      search=s;
      notifyListeners();
  }

  void remove(){
    search = "";
    notifyListeners();
  }
}

final searchProvider=ChangeNotifierProvider<SearchNotifier>((ref) => SearchNotifier());