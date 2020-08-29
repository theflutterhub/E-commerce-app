import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Badge(
      position: BadgePosition(left: 25, top: 8),
      badgeContent: Text(
        productProvider.getNotificationIndex.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      badgeColor: Colors.red,
      child: IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
          onPressed: () {}),
    );
  }
}
