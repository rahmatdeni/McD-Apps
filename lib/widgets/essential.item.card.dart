import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mcd_app/models/food.models.dart';
import 'package:mcd_app/screen/detail.product.screen.dart';
import 'package:mcd_app/style/app.color.dart';

class EssentialItemCard extends StatelessWidget {
  final FoodModels food;
  const EssentialItemCard({this.food});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        DetailProductScreen(
          food: food,
        ),
      ),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: food.photo,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
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
              Text(
                food.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                food.desc.toString().substring(0, 14),
                style: TextStyle(fontSize: 14, color: darkGrey),
              ),
              Text(
                '\$${food.price}',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
