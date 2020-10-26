import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:innovex_solutions/res/size_config.dart';

Color teal = Color.fromRGBO(0, 128, 128, 1);

Color darkblue = const Color(0xFF1D3461);
Color defaultred = const Color(0xFFFB3640);
Color dark3 = const Color(0xFF222233);
Color cyan = const Color(0xFF1fbad6);

Color darklime = const Color(0xFF8E8E53);
Color bgColor = Colors.grey[300];


//#F2F4F4


var heightm = SizeConfig.heightMultiplier;
var widthm = SizeConfig.widthMultiplier;
var textm = SizeConfig.textMultiplier;

final spinKit = SpinKitThreeBounce(
  color: Colors.white,
  size: 20.0,
);

final spinKitBlack = SpinKitThreeBounce (
  color: Colors.black,
  size: 20.0,
);

final spinKitBlackSmall = SpinKitThreeBounce(
  color: Colors.black,
  size: 10.0,
);

final spinKitTeal = SpinKitThreeBounce(
  color: teal,
  size: 15.0,
);

///FToast
void showToast(BuildContext context, String text) {
  ScreenUtil.init(context, designSize: Size(720, 1280), allowFontScaling: false);
  var size = ScreenUtil();
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: teal,
    textColor: Colors.black,
    fontSize: size.setSp(24),
  );
}