import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mcd_app/style/app.color.dart';
import 'package:mcd_app/style/app.constant.dart';
import 'package:mcd_app/views/essential.views.dart';
import 'package:mcd_app/views/popular.views.dart';
import 'package:mcd_app/views/search.view.dart';
import 'package:mcd_app/widgets/essential.item.card.dart';
import 'package:mcd_app/widgets/menu.item.card.dart';
import 'package:mcd_app/widgets/popular.item.card.dart';
import 'package:mcd_app/widgets/search.bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _listMenu = ["Food", "Grocery", "Fruits"];
  int _selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height: 20,
                  ),
                  SearchBarViews(
                    controller: _searchController,
                    hint: 'Search',
                    icon: Icon(
                      FlutterIcons.search_faw,
                      color: darkGrey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _listMenu.length,
                      itemBuilder: (context, index) {
                        return MenuItemCard(
                          index: index,
                          onTap: () {
                            setState(() {
                              _selectedMenu = index;
                            });
                          },
                          selectedMenu: _selectedMenu,
                          title: _listMenu[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${txtPopular}',
                        style: TextStyle(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${txtViewAll}',
                        style: TextStyle(
                          fontSize: 15,
                          color: red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    child: PopularViews(
                      popularItemsss: popularItems,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${txtNewEssential}',
                        style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${txtViewAll}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 290,
                    child: EssentialViews(
                      essentialItems: essentialItems,
                      itemHeight: itemHeight,
                      itemWidth: itemWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
