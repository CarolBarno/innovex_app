import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovex_solutions/apis/register_api.dart';

class Tasks {
  String programTime;
  String event;
  String message;
  String actualTime;
  String displayMessage;
  String color;

  Tasks(
      {this.message,
      this.color,
      this.actualTime,
      this.displayMessage,
      this.event,
      this.programTime});

  factory Tasks.fromJson(Map<String, dynamic> json) {
    return Tasks(
        programTime: json['program_time'],
        event: json['event'],
        message: json['message'],
        actualTime: json['actual_time'],
        displayMessage: json['display_message'],
        color: json['color']);
  }
}



Tasks parseTasks(responseBody) {


  Tasks tasks =  Tasks.fromJson(responseBody);


  return tasks;
}

class LatestTaskProvider extends ChangeNotifier {
  LatestTaskProvider() {
    setUpTimedFetch();
  }

  Map<String, dynamic> decodeData;
  Tasks list;

  String _color ;
  String _color1 ;
  String _color2 ;

  String get color => _color;
  String get color1 => _color1;
  String get color2 => _color2;
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  setUpTimedFetch() {
    Timer timer = Timer.periodic(Duration(milliseconds: 5000), (timer) {
      getLatestTask();
    });
  }

  getLatestTask() async {
    var res = await getData("due-report");
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      decodeData = body;

      if(body['content']['event'] == 'START') {
        _color = body['content']['color'].replaceAll('#', '0xff');
        notifyListeners();
      }

      if(body['content']['event'] == 'STOP') {
        _color1 = body['content']['color'].replaceAll('#', '0xff');
        notifyListeners();
      }

      if(body['content']['event'] == 'REPORT') {
        _color2 = body['content']['color'].replaceAll('#', '0xff');
        notifyListeners();
      }

      print('success data $decodeData');
    } else {
      throw Exception('Error fetching data');
    }
  }


  getTasksData() {
    if (decodeData == null) {
      print('data is null');
      return null;
    } else {
      list = parseTasks(decodeData['content']);
      return list;
    }
  }
}
