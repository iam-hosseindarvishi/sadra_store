import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier(super.state);
  void add(String s){
      state=s;
  }
  void remove(){
    state="";
  }
}