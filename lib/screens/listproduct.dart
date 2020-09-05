import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:e_commerce/provider/product_provider.dart';

import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/search_category.dart';
import 'package:e_commerce/screens/search_product.dart';

import 'package:e_commerce/widgets/singeproduct.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  final String name;
  bool isCategory = true;
  final List<Product> snapShot;
  ListProduct({
    this.name,
    this.isCategory,
    this.snapShot,
  });
  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            }),
        actions: <Widget>[
          isCategory == true
              ? IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    categoryProvider.getSearchList(list: snapShot);
                    showSearch(context: context, delegate: SearchCategory());
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    productProvider.getSearchList(list: snapShot);
                    showSearch(context: context, delegate: SearchProduct());
                  },
                ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    childAspectRatio:
                        orientation == Orientation.portrait ? 0.7 : 0.9,
                    scrollDirection: Axis.vertical,
                    children: snapShot
                        .map(
                          (e) => SingleProduct(
                            price: e.price,
                            image: e.image,
                            name: e.name,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
