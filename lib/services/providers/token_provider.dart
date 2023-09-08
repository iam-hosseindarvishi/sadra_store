import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/token.dart';
class TokenNotifier extends ChangeNotifier {
  late Token token;
  void add (Token t){
    token=t;
    notifyListeners();
  }

  Token getToken(){
    return token;
  }
}
final tokenProvider=ChangeNotifierProvider<TokenNotifier>((ref) => TokenNotifier());