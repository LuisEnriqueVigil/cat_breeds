import 'package:flutter/material.dart';
import 'package:test_aplication/domain/models/cat_model.dart';

class HomeController extends ChangeNotifier{
  List<CatModel> _listOfCats = [];
  TextEditingController _textEditingController = TextEditingController();

  List<CatModel> get listOfCats => _listOfCats; 
  set listOfCats(List<CatModel> valor){
    _listOfCats = valor;
    notifyListeners();
  }

  TextEditingController get textEditingController => _textEditingController; 
  set textEditingController(TextEditingController valor){
    _textEditingController = valor;
    notifyListeners();
  }
}