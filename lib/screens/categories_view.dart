import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/providers/categories_data.dart';
import 'package:news_app/models/providers/categories_provider.dart';
import 'package:news_app/screens/categories_news.dart';
import 'package:provider/provider.dart';

class NewsCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Categories>(context, listen: false);
    print("item rebuilds!");
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => CategoryNews(
                      category: item.categoriesTitle.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Consumer<Categories>(
                builder: (ctx, item, _) => CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                item.categoriesTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
