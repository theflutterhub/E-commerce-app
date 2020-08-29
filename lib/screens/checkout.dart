import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/cartsingleproduct.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  ProductProvider productProvider;

  Widget _buildBottomDetail({String startName, String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double subTotal = 0;
    double discount = 3;
    double discountRupees;
    double shipping = 60;
    double total;
    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getCheckOutModelList.forEach((element) {
      subTotal += element.price * element.quentity;
    });
    discountRupees = discount / 100 * subTotal;
    total = subTotal + shipping - discountRupees;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut Page", style: TextStyle(color: Colors.black)),
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
          },
        ),
        actions: <Widget>[
          NotificationButton(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 15),
        child: RaisedButton(
          color: Color(0xff746bc9),
          child: Text(
            "Buy",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 480,
              child: ListView.builder(
                itemCount: productProvider.getCheckOutModelListLength,
                itemBuilder: (ctx, index) {
                  return CartSingleProduct(
                    image: productProvider.getCheckOutModelList[index].image,
                    name: productProvider.getCheckOutModelList[index].name,
                    price: productProvider.getCheckOutModelList[index].price,
                    quentity:
                        productProvider.getCheckOutModelList[index].quentity,
                  );
                },
              ),
            ),
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildBottomDetail(
                    startName: "Subtotal",
                    endName: "\$ ${subTotal.toStringAsFixed(2)}",
                  ),
                  _buildBottomDetail(
                    startName: "Discount",
                    endName: "${discount.toStringAsFixed(2)}%",
                  ),
                  _buildBottomDetail(
                    startName: "Shipping",
                    endName: "\$ ${shipping.toStringAsFixed(2)}",
                  ),
                  _buildBottomDetail(
                    startName: "Total",
                    endName: "\$ ${total.toStringAsFixed(2)}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
