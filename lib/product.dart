import 'package:coldStorage/models/products.dart';
import 'package:coldStorage/screens/productDetailScreen.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'pages/productPage.dart';

class ProductSheets extends StatefulWidget {
  @override
  _ProductSheetsState createState() => _ProductSheetsState();
}

class _ProductSheetsState extends State<ProductSheets> {
  List<Product> products = [
    Product(
        'assets/headphones.png', 'roackerz 400 On-Ear ', 'description', 45.3),
    Product(
        'assets/headphones_2.png', 'roackerz 100 On-Ear ', 'description', 22.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // height: 500,
          decoration: BoxDecoration(
            color: orange,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                // semanticChildCount:1,
                itemBuilder: (_, index) {
                  return Column(
                    children: <Widget>[
                      Products(
                        products[index],
                        onRemove: () {
                          setState(() {
                            products.remove(products[index]);
                          });
                        },
                      ),
                      // index == 4
                      //     ? SizedBox()
                      //     : Container(
                      //         width: 2,
                      //         height: 50,
                      //         color: Color.fromRGBO(100, 100, 100, 0.1))
                    ],
                  );
                }),
          )),
    );
  }
}

class Products extends StatelessWidget {
  final Product product;
  final Function onRemove;

  const Products(this.product, {Key key, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: yellow,
      body: Container(
          decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(24)
             ),
            gradient: RadialGradient(
                colors:
                 [
                   bgColor,
                   bgColor
                  //  Color(0xFF3297FA),
                  //  Color(0xFF3297FA)
                  // Color.fromRGBO(255, 255, 255, 0.9),
                  // Color.fromRGBO(255, 255, 255, 0.9)
                  // Color(0xff36E892),
                  // Color(0xff33B2B9)
                  // Colors.grey[500], Colors.grey[700]
                ],
                center: Alignment(0, 0),
                radius: 0.6,
                focal: Alignment(0, 0),
                focalRadius: 0.1),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          width: MediaQuery.of(context).size.width / 2,
          // height: ,
          child: Column(
            children: <Widget>[
              ShopProductDisplay(
                product,
                onPressed: onRemove,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                '\$${product.price}',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ],
          )),
    );
  }
}

class ShopProductDisplay extends StatelessWidget {
  final Product product;
  final Function onPressed;

  const ShopProductDisplay(this.product, {Key key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ViewProductPage(
            product: product,
          ),
        ),
      ),
      child: SizedBox(
        height: 158,
        width: 200,
        child: Stack(children: <Widget>[
          ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Container(
              color: bgColor,

                // decoration: BoxDecoration(
                //   //  borderRadius: BorderRadius.all(Radius.circular(24)),
                //   gradient: RadialGradient(
                //       colors: [
                //         bgColor,
                //         bgColor
                //         // Color.fromRGBO(255, 255, 255, 0.9),
                //         // Color.fromRGBO(255, 255, 255, 0.9)
                //         // yellow, yellow
                //         // Color(0xff36E892),
                //         // Color(0xff33B2B9)
                //         // Colors.grey[500], Colors.grey[700]
                //       ],
                //       center: Alignment(0, 0),
                //       radius: 0.6,
                //       focal: Alignment(0, 0),
                //       focalRadius: 0.1),
                // ),
                child: Hero(
                    tag: product.image, child: Image.asset(product.image))
                    ),
          ),

          // Positioned(
          //   left: 25,
          //   child: SizedBox(
          //     height: 150,
          //     width: 150,
          //     child: Transform.scale(
          //       scale: 1.2,
          //       child: Image.asset('assets/bottom_yellow.png'),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 50,
          //   top: 5,
          //   child: SizedBox(
          //       height: 80,
          //       width: 80,
          //       child: Image.asset(
          //         '${product.image}',
          //         fit: BoxFit.contain,
          //       )),
          // ),
        ]),
      ),
    );
  }
}

class ProductSheet extends StatefulWidget {
  @override
  _ProductSheetState createState() => _ProductSheetState();
}

class _ProductSheetState extends State<ProductSheet> {
  List<Product> products = [
    Product('assets/gas/gM.png', 'Burner Boy', '​In view of the increasing demand for LPG', 2.33),
    Product('assets/ola/o1.png', 'Mineral Chan Oil', '​In view of the increasing demand for LPG', 10),
    Product('assets/ola/o2.png', 'Multivis', '​In view of the increasing demand for LPG', 20),
    Product('assets/ola/o3.png', 'Ola Gas',
        'v', 30),
    Product('assets/ola/o4.png', 'Super offer', '​In view of the increasing demand for LPG', 40),
    Product('assets/ola/o5.png', 'DEOGEN std', '​In view of the increasing demand for LPG', 102.33),
    Product('assets/ola/o6.png', 'Burner And Nozzle', '​In view of the increasing demand for LPG', 52.33),
    Product('assets/ola/o7.png', 'Stand', '​In view of the increasing demand for LPG', 62.33),

   Product('assets/ola/o8.png', 'Travel Express', '​In view of the increasing demand for LPG', 40),
    Product('assets/ola/o9.png', 'LPG oal', '​In view of the increasing demand for LPG', 102.33),
    Product('assets/ola/o11.png', 'Awesome Oal', '​In view of the increasing demand for LPG', 52.33),
    Product('assets/ola/o12.png', 'Ferrarie Sweat', '​In view of the increasing demand for LPG', 62.33),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mediumGrey,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Container(
                decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(15)),
                     ),
                padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    // crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.5/0.8 ,
                    // crossAxisSpacing: 20,
                    // mainAxisSpacing: 20,
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    return Products(
                      products[index],
                      onRemove: () {
                        setState(() {
                          products.remove(products[index]);
                        });
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
