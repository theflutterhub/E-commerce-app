import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/cartscreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final bool isCount;
  final String color;
  final String size;
  int quentity;
  final double price;
  CartSingleProduct({
    this.index,
    this.color,
    this.size,
    this.isCount,
    this.quentity,
    this.image,
    this.name,
    this.price,
  });
  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}

TextStyle myStyle = TextStyle(fontSize: 18);
ProductProvider productProvider;

class _CartSingleProductState extends State<CartSingleProduct> {
  Widget _buildImage() {
    return Container(
      height: 130,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image),
        ),
      ),
    );
  }

  Widget _buildNameAndClosePart() {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: myStyle,
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              widget.isCount == false
                  ? productProvider.deleteCartProduct(widget.index)
                  : productProvider.deleteCheckoutProduct(widget.index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildColorAndSizePart() {
    return Container(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.color,
            style: myStyle,
          ),
          Text(
            widget.size,
            style: myStyle,
          )
        ],
      ),
    );
  }

  Widget _buildCountOrNot() {
    return Container(
      height: 35,
      width: widget.isCount == false ? 120 : 100,
      color: Color(0xfff2f2f2),
      child: widget.isCount == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.remove),
                  onTap: () {
                    setState(() {
                      if (widget.quentity > 1) {
                        widget.quentity--;

                        // productProvider.getCheckOutData(
                        //   color: widget.color,
                        //   image: widget.image,
                        //   name: widget.name,
                        //   price: widget.price,
                        //   quentity: widget.quentity,
                        //   size: widget.size,
                        // );
                      }
                    });
                  },
                ),
                Text(
                  widget.quentity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  child: Icon(Icons.add),
                  onTap: () {
                    setState(() {
                      widget.quentity++;
                      productProvider.getCheckOutData(
                        color: widget.color,
                        image: widget.image,
                        name: widget.name,
                        price: widget.price,
                        quentity: widget.quentity,
                        size: widget.size,
                      );
                    });
                  },
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Quentity"),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    widget.quentity.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    double totalPrice = widget.price * widget.quentity;
    
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildImage(),
                Container(
                  height: 140,
                  width: widget.isCount == true ? 244 : 270,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildNameAndClosePart(),
                        _buildColorAndSizePart(),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Color(0xff9b96d6),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        _buildCountOrNot(),
                      ],
                    ),
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
