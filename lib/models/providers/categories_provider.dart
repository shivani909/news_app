import 'package:flutter/foundation.dart';
import 'package:news_app/models/providers/categories_data.dart';

class CategoryItems with ChangeNotifier {
  List<Categories> _appCategories = [
    Categories(
      imageUrl:
          "https://images.unsplash.com/photo-1451187863213-d1bcbaae3fa3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzN8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60",
      categoriesTitle: "Technology",
    ),
    Categories(
      imageUrl:
          "https://images.unsplash.com/photo-1545126178-862cdb469409?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aW5kaWF8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60",
      categoriesTitle: "Entertainment",
    ),
    Categories(
      imageUrl:
          "https://images.unsplash.com/photo-1612556810513-617a5a892418?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fHN0YXJ0dXBzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60",
      categoriesTitle: "General",
    ),
    Categories(
      imageUrl:
          "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVzaW5lc3N8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60",
      categoriesTitle: "Business",
    ),
    Categories(
      imageUrl:
          "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29yb25hdmlydXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=60",
      categoriesTitle: "Health",
    ),
  ];

  List<Categories> get appCategories {
    return [..._appCategories];
  }

  Categories findByImg(String imageUrl) {
    return _appCategories.firstWhere((img) => img.imageUrl == imageUrl);
  }

  void addCategory() {
    notifyListeners();
  }
}
