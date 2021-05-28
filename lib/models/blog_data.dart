import 'package:flutter/foundation.dart';

class BlogModel with ChangeNotifier {
  final String imgUrl;
  final String title;
  final String description;

  BlogModel(
      {@required this.imgUrl,
      @required this.title,
      @required this.description});

  void listners() {
    notifyListeners();
  }
}
