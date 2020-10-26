import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovex_solutions/apis/register_api.dart';

class Report {
  String programTime;
  String event;
  String message;
  String actualTime;
  String displayMessage;
  String color;

  Report(
      {this.message,
      this.color,
      this.actualTime,
      this.displayMessage,
      this.event,
      this.programTime});

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
        programTime: json['program_time'],
        event: json['event'],
        message: json['message'],
        actualTime: json['actual_time'],
        displayMessage: json['display_message'],
        color: json['color']);
  }
}

List<Report> parseReports(responseBody) {
  final parse = responseBody.cast<Map<String, dynamic>>();

  var parsed = parse.map<Report>((json) => Report.fromJson(json)).toList();

  return parsed;
}

class ReportsProvider extends ChangeNotifier {
  ReportsProvider() {
    getReports();
  }

  Map<String, dynamic> decodeData;
  List<Report> list;

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<List<Report>> getReports() async {
    _isFetching = true;
    notifyListeners();

    var response;

    try {
      response =
          await getData("task-report").timeout(const Duration(seconds: 30));

      print(' data response ${response.body}');
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        decodeData = body;
        print('success data $decodeData');
      } else {
        throw Exception('Error fetching data');
      }
    } on TimeoutException {
      print("Timeout exception");
    } on SocketException {
      print("Socket exception");
    }

    print("fetch reports done");
    _isFetching = false;
    notifyListeners();
  }


  getReportsData() {
    if (decodeData == null) {
      print('data is null');
      return null;
    } else {
      list = parseReports(decodeData['content']);
      return list;
    }
  }
}
