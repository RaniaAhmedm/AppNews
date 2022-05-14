import 'package:app_news/home-screen/categories/item-category.dart';
import 'package:app_news/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesFragment extends StatefulWidget {
  Function onCategoryHomeClicked;
  CategoriesFragment(this.onCategoryHomeClicked);

  @override
  State<CategoriesFragment> createState() => _CategoriesFragmentState();
}

class _CategoriesFragmentState extends State<CategoriesFragment> {
  List<Category> categoriesList = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Text(
                AppLocalizations.of(context)!.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: .92
              ),
              itemBuilder: (_, index) =>
                  ItemCategory(category: categoriesList[index],
                      index: index,onCategoryClicked: categoriesFragment),
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }

  void categoriesFragment(Category category){
    widget.onCategoryHomeClicked(category);

  }
}
