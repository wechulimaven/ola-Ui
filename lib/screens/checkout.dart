import 'package:coldStorage/models/products.dart';
import 'package:coldStorage/pages/addressPage.dart';
import 'package:coldStorage/pages/unpaidPage.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:coldStorage/widgets/creditCard.dart';
import 'package:coldStorage/widgets/shopList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


//TODO: NOT DONE. WHEEL SCROLL QUANTITY
class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product(
        'assets/ola/o1.png',
        'Gas Tamu',
        'description',
        45.3),
    Product(
        'assets/ola/o2.png',
        'Engine Oil',
        'description',
        22.3),
    Product(
        'assets/ola/o3.png',
        'Supporter',
        'description',
        58.3)
  ];

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/denied_wallet.png'),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => UnpaidPage())),
          )
        ],
        title: Text(
          'Checkout',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  height: 48.0,
                  color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            color:mediumGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        products.length.toString() + ' items',
                        style: TextStyle(
                            color:mediumGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => ShopItemList(products[index],onRemove: (){
                        setState(() {
                          products.remove(products[index]);
                        });
                      },),
                      itemCount: products.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                        fontSize: 20,
                        color: mediumGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Swiper(
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return CreditCard();
                    },
                    scale: 0.8,
                    controller: swiperController,
                    viewportFraction: 0.6,
                    loop: false,
                    fade: 0.7,
                  ),
                ),
                SizedBox(height: 24),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom == 0
                          ? 20
                          : MediaQuery.of(context).padding.bottom),
                  child: checkOutButton,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
