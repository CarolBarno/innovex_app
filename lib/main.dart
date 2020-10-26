import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovex_solutions/apis/constants.dart';
import 'package:innovex_solutions/res/size_config.dart';
import 'package:innovex_solutions/view/home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Innovex Solutions',
            theme: ThemeData(primaryColor: teal, fontFamily: 'OpenSans'),
            initialRoute: '/home',
            routes: <String, WidgetBuilder>{
              '/home': (context) => Home(),
            });
      });
    });
  }
}