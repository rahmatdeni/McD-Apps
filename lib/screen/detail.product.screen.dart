import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mcd_app/models/food.models.dart';
import 'package:mcd_app/style/app.color.dart';
import 'package:mcd_app/style/app.constant.dart';

class DetailProductScreen extends StatefulWidget {
  final FoodModels food;
  DetailProductScreen({this.food});

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  double price = 0.0;
  int counter = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = widget.food.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          FlutterIcons.menu_ent,
                          color: black,
                        ),
                        Icon(
                          FlutterIcons.cart_mco,
                          color: red,
                        )
                      ],
                    ),
                    Container(
                      height: 400,
                      width: 400,
                      child: CachedNetworkImage(
                        imageUrl: widget.food.photo,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                            height: 25,
                            width: 25,
                            child: SpinKitFadingCircle(
                              color: red,
                            )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Veg Burger',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: black),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(onTap: () {
                              setState(() {
                                if (counter > 1){
                                  counter -= 1;
                                  price -= widget.food.price;
                                }
                              });
                            },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: counter > 1 ? red : lightGrey,
                                ),
                                child: Center(
                                  child: Text(
                                    '-',
                                    style:
                                        TextStyle(color: white, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${counter}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter += 1;
                                  price += widget.food.price;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: red,
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style:
                                        TextStyle(color: white, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.food.desc,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Total',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              '\$ ${price.toString()}',
                              style: TextStyle(
                                  color: red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: red,
                          ),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
