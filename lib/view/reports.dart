import 'package:flutter/material.dart';
import 'package:innovex_solutions/apis/constants.dart';
import 'package:innovex_solutions/provider/report_provider.dart';
import 'package:provider/provider.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReportsProvider>.value(
            value: ReportsProvider()),
      ],
      child: Builder(builder: (context) {
        final report = Provider.of<ReportsProvider>(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 6 * widthm,
                color: Colors.grey[500],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Report',
              //textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 2.3 * textm,
                  color: teal,
                  fontWeight: FontWeight.w800),
            ),
          ),
          body: report.isFetching
              ? Center(
                  child: spinKitBlack,
                )
              : report.getReportsData().length != 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: report.getReportsData().length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        List<Report> my = report.getReportsData();

                        return Card(
                          shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(2 * widthm)
                              ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                3 * widthm, 2 * widthm, 2 * widthm, 2 * widthm),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Program Time',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 1.5 * textm,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.2 * heightm,
                                          ),
                                          Text(
                                            '${my[index].programTime}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.teal,
                                              fontSize: 1.8 * textm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Actual Time',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 1.5 * textm,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.2 * heightm,
                                          ),
                                          Text(
                                            '${my[index].actualTime}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.teal,
                                              fontSize: 1.8 * textm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2 * heightm,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Event ',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 1.5 * textm,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.2 * heightm,
                                          ),
                                          Text(
                                            '${my[index].event}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.teal,
                                              fontSize: 1.8 * textm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Message',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 1.5 * textm,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.2 * heightm,
                                          ),
                                          Text(
                                            '${my[index].message}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.teal,
                                              fontSize: 1.8 * textm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2 * heightm,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Display Message',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 1.5 * textm,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.2 * heightm,
                                          ),
                                          Text(
                                            '${my[index].displayMessage}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.teal,
                                              fontSize: 1.8 * textm,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 2 * heightm,
                        ),
//                        Image.asset(
//                          'assets/images/sad.png',
//                          height: 10 * heightm,
//                          width: 10 * widthm,
//                          color: Colors.grey[500],
//                        ),
//                        SizedBox(
//                          height: 2 * heightm,
//                        ),
                        Text(
                          'No Reports found',
                          style: TextStyle(
                            fontSize: 2 * textm,
                            color: Colors.grey[800],
                          ),
                        )
                      ],
                    )),
        );
      }),
    );
  }
}
