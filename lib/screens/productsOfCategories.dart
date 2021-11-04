import 'package:flutter/material.dart';
import 'package:vibes_store/allLists.dart';
import 'package:vibes_store/widgets/rowWidget.dart';
import 'package:vibes_store/shared/sharedColor.dart';
import 'package:vibes_store/shared/sharedFontStyle.dart';



class ProductsOfCategories extends StatefulWidget {
  final List categoryList;
  const ProductsOfCategories(this.categoryList);

  @override
  _ProductsOfCategoriesState createState() => _ProductsOfCategoriesState();
}

class _ProductsOfCategoriesState extends State<ProductsOfCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
      ),
      body: RowWidget(widget.categoryList),
      
    );
  }
}