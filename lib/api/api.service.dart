import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';

import '../model/user.model.dart';
import 'config.dart';

class Services {
  final client = http.Client();

  var earlyMorning = Jiffy.now().startOf(Unit.day).format();

  var lateMidnight = Jiffy.now().endOf(Unit.day).format();

  String token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYWRtaW4tdHdwIiwiaWQiOiI2NDc0ODFjYWRhMzY3OTIwZTdlNjg0ZGUiLCJlbWFpbCI6ImFkbWluQHR3cC5pbiIsImlhdCI6MTY4NzU5MjY0NCwiZXhwIjoxNjg3NjE3ODQ0fQ.nHmFZnFndur5BSLfMXLEG0xw-IisiqamAYBZSlfYIbA';

  //Getting Data using model
  Future<List<UserModel>?> getDataFromModel(endPoint) async {
    final response = await http.get(
      Uri.parse(
        '$apiUrl/endPoint',
      ),
      headers: <String, String>{
        'Authorization': token,
        'Content-Type': 'application/json'
      },
    );

    var json = response.body;
    // print('The Data--> ${json}');

    if (response.statusCode == 200) {
      return theUsersFromModel(json);
    } else if (response.statusCode == 401) {
    } else {
      return null;
    }
  }

  //Count of  a particular seva done in a day
  Future getTodaysParticlarSeva(value, endPoint) async {
    //example of using 'value' with if-else
    var url = value.toString() == 'All'
        ? '$apiUrl/${endPoint}/${earlyMorning}/${lateMidnight}'
        : '$apiUrl/${endPoint}DESC&filter[where][and][0][something]=${value}/${earlyMorning}/${lateMidnight}';

    final response = await http.get(
      Uri.parse(
        '${endPoint}',
      ),
      headers: <String, String>{
        'Authorization': token,
        'Content-Type': 'application/json'
      },
    );

    var json = response.body;
    // print('The Data--> ${json}');

    if (response.statusCode == 200) {
      return json;
    } else {
      return null;
    }
  }

  //Posting data
  Future postData(endPoint, startDate, endDate) async {
    final url = Uri.parse('$apiUrl/${endPoint}/${startDate}/${endDate}');
    //endpoint can also include filters

    final response = await http.post(
      url,
      headers: <String, String>{
        'Authorization': token,
        'Content-Type': 'application/json'
      },
    );

    var json = response.body;
    // print('The data--> ${json}');

    if (response.statusCode == 200) {
      return json;
    } else {
      return null;
    }
  }
}
