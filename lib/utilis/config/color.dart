import 'package:flutter/material.dart';

const Color primary = Color(0xFFFF3378);
const Color secondary = Color(0xFFFF2278);

const Color orange = Color(0xFFFFA500);
const Color mediumGrey = Color(0xFFE2E2E2);
const Color darkRed = Color(0xFF9A0000);
const Color transparentRed = Color(0xFFFFDBA4);

const Color bgColor = Color(0xFF3297FA);
const Color lightBlue = Color(0xFFAFD5FA);

// const Color yellow = Color(0xff008000);
// const Color mediumYellow = Color(0xff52B640);
// const Color darkYellow = Color(0xff329B24);
// const Color transparentYellow = Color.fromRGBO(140, 239, 116, 1);
const Color darkGrey = Color(0xFFDF9316);
const kPurple = Color(0xFF6F51FF);
// const Color myColor = Colors.brown;

const LinearGradient mainButton = LinearGradient(colors: [
  Color(0xFFFFA500),
  Color(0xFFC07100),
  Color(0xFFFFB733),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}

var kTitleStyle = TextStyle(fontFamily: 'Montserrat',
color: darkGrey,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);


var kSubtitleStyle = TextStyle(fontFamily: 'Montserrat',
  color: darkGrey,
  fontSize: 14.0,
);
var kTitleItem =TextStyle(fontFamily: 'NunitoSans',
  color: darkRed,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);
var kSubtitleItem = TextStyle(fontFamily: 'Montserrat',
  color: darkGrey,
  fontSize: 12.0,
);
var kHintStyle = TextStyle(fontFamily: 'Montserrat',
  color: darkGrey,
  fontSize: 12.0,
);