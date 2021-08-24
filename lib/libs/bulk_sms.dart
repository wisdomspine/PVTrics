import 'dart:convert';

import 'package:http/http.dart' as http;

class BulkSms {
  static const String endpoint =
      'https://www.bulksmsnigeria.com/api/v1/sms/create?';

  final String apiKey;

  BulkSms({required this.apiKey});
  Future sendMessage(
      {required String message,
      required String sender,
      required List<String> receipients}) async {
    var joined = receipients.join(", ");
    joined = joined.replaceAll(RegExp(r"\s"), "");
    if (joined.trim().isEmpty) throw ("No receivers");
    var request = http.Request(
        'GET',
        Uri.parse(
            '${endpoint}api_token=$apiKey&from=$sender&to=$joined&body=$message'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      if (map["data"] != null && map["data"]["status"] == "success") {
        return;
      } else if (map["error"] != null) {
        // message sent
        throw Exception(map["error"]["message"]);
      }
      throw Exception("Message not sent check your unit");
    }
    throw Exception("Message not sent, please check your internet connection");
  }
}
