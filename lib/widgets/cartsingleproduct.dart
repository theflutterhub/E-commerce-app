import 'package:e_commerce/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final bool isCount;
  int quentity;
  final double price;
  CartSingleProduct({
    this.index,
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
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: widget.isCount == true ? 244 : 270,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
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
                                      ? productProvider
                                          .deleteCartProduct(widget.index)
                                      : productProvider
                                          .deleteCheckoutProduct(widget.index);
                                },
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Cloths",
                          style: myStyle,
                        ),
                        Text(
                          "\$${widget.price.toString()}",
                          style: TextStyle(
                              color: Color(0xff9b96d6),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: widget.isCount == false ? 120 : 100,
                          color: Color(0xfff2f2f2),
                          child: widget.isCount == false
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Icon(Icons.remove),
                                      onTap: () {
                                        setState(() {
                                          if (widget.quentity > 1) {
                                            widget.quentity--;
                                            productProvider.getCheckOutData(
                                              quentity: widget.quentity,
                                              image: widget.image,
                                              name: widget.name,
                                              price: widget.price,
                                            );
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
                                            quentity: widget.quentity,
                                            image: widget.image,
                                            name: widget.name,
                                            price: widget.price,
                                          );
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        ),
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
