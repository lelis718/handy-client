import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:handyclientapp/model/help.dart';

abstract class HelpService {
  Future<bool> askHelp(Help help);
  Future<List<Help>> getHelp();
  Future<List<Help>> getHelpFrom(String userId);
}

class HelpServiceDefault extends HelpService {
  final address = "https://us-central1-handy-app-ad6a5.cloudfunctions.net";
  
  @override
  Future<bool> askHelp(Help help) async {
    var response = await http.post("$address/app/help", body: help.toJson());
    return response.statusCode == 200;
  }

  @override
  Future<List<Help>> getHelp() async {
    var response = await http.get("$address/app/help");
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List<Help> helps = List<Help>();
      for (var h in result) {
        helps.add(Help.fromJson(h));
      }
      return helps;
    } else {
      throw Exception('Failed to get help');
    }
  }

  @override
  Future<List<Help>> getHelpFrom(String userId) async {
    var response = await http.get("${address}/app/helpFrom/${userId}");
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List<Help> helps = List<Help>();
      for (var h in result) {
        helps.add(Help.fromJson(h));
      }
      return helps;
    } else {
      throw Exception('Failed to get help');
    }
  }
}
