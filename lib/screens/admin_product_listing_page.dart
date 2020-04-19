import 'package:badiup/widgets/product_listing.dart';
import 'package:flutter/material.dart';

import 'package:badiup/test_keys.dart';
import 'package:badiup/screens/admin_new_product_page.dart';
import 'package:badiup/models/custom_color_model.dart';

class AdminProductListingPage extends StatefulWidget {
  AdminProductListingPage({Key key, this.title, this.customColorList}) : super(key: key);

  final String title;
  final CustomColorList customColorList;

  @override
  _AdminProductListingPageState createState() =>
      _AdminProductListingPageState();
}

class _AdminProductListingPageState extends State<AdminProductListingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ProductListing(customColorList: widget.customColorList),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("商品リスト"),
      centerTitle: true,
      actions: <Widget>[
        _buildNewProductButton(context),
      ],
    );
  }

  Widget _buildNewProductButton(BuildContext context) {
    return IconButton(
      key: Key(makeTestKeyString(
        TKUsers.admin,
        TKScreens.productListing,
        "addNew",
      )),
      icon: Icon(
        Icons.add,
        semanticLabel: 'new_product',
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminNewProductPage(customColorList: widget.customColorList),
          ),
        );
      },
    );
  }
}
