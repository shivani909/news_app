import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  String imageUrl;
  String categoriesTitle;

  Categories({@required this.imageUrl, @required this.categoriesTitle});

  void listners() {
    notifyListeners();
  }
}
