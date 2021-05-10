import 'package:coldStorage/models/category.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:coldStorage/widgets/categoryCard.dart';
import 'package:coldStorage/screens/recommendedProducts.dart';
import 'package:coldStorage/widgets/gridStaggeredCategory.dart';

import 'package:flutter/material.dart';

import 'offersPromos.dart';

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      "LPG's",
      'assets/ola/f2.png',
    ),
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Fuels',
      'assets/ola/f1.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Lubricants',
      'assets/lubricant/lub.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Shop and Services',
      'assets/ola/ola1.jpg',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Card Services',
      'assets/ola/card.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Lubricants',
      'assets/lubricant/Lubricon.png',
    ),
  ];

  List<Category> searchResults;

  // final TabController tabController;

  // TabView({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                    width: 4,
                    color: mediumGrey,
                  ),
                ),
                Center(
                    child: Text(
                  'Services and Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              margin: EdgeInsets.all(12.0),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: InkWell(
                    // categories[index].category,
                    child: StaggeredCardCard(
                      begin: categories[index].begin,
                      end: categories[index].end,
                      categoryName: categories[index].category,
                      assetPath: categories[index].image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          // Flexible(child: PromoListPage()),
          Flexible(child: RecommendedList()),
        ],
      ),
    );
  }
}
