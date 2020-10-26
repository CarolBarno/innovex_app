import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:innovex_solutions/apis/constants.dart';
import 'package:innovex_solutions/provider/latest_task_provider.dart';
import 'package:innovex_solutions/view/reports.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LatestTaskProvider>.value(
            value: LatestTaskProvider()),
      ],
      child: Builder(
        builder: (context) {
          final task = Provider.of<LatestTaskProvider>(context);

          Tasks my = task.getTasksData();

          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.white,
                title: Text(
                  'Clock',
                  style: TextStyle(
                      fontSize: 2.3 * textm,
                      color: teal,
                      fontWeight: FontWeight.w800),
                ),
              ),
              body: Center(
                child: Container(
                  color: task.color == null ? Colors.white : Color(int.parse(task.color)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5 * heightm,
                      ),
                      FlutterAnalogClock(
                        dateTime: DateTime(2019, 1, 13, 12, 00, 00),
                        dialPlateColor: task.color1 == null ? Colors.white : Color(int.parse(task.color1)),
                        hourHandColor: Colors.black,
                        minuteHandColor: Colors.black,
                        secondHandColor: Colors.black,
                        numberColor: task.color2 == null ? Colors.black : Color(int.parse(task.color2)),
                        borderColor: Colors.black,
                        tickColor: Colors.black,
                        centerPointColor: Colors.black,
                        showBorder: true,
                        showTicks: true,
                        showMinuteHand: true,
                        showSecondHand: true,
                        showNumber: true,
                        borderWidth: 3.0,
                        hourNumberScale: .80,
                        hourNumbers: [
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12'
                        ],
                        isLive: true,
                        width: 200.0,
                        height: 200.0,
                        decoration: const BoxDecoration(),
                      ),
                      SizedBox(
                        height: 10 * heightm,
                      ),
                      my == null ? Text('') :
                      Text('${my.programTime}  ' "-" '  ${my.message}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.5 * textm
                      ),),
                      SizedBox(
                        height: 30 * heightm,
                      ),
                      Container(
                        width: 49 * widthm,
                        height: 6 * heightm,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1 * widthm),
                          color: teal,
                        ),
                        child: MaterialButton(
                          disabledColor: Colors.grey,
//                  color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
//                    padding: EdgeInsets.fromLTRB(
//                        3 * widthm, 3 * widthm, 3 * widthm, 3 * widthm),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: Reports(),
                                    type: PageTransitionType
                                        .rightToLeftWithFade));
                          },
                          child: Text(
                            'Report',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
    );
  }
}
