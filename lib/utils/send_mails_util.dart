import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../tools/api_keys.dart';
import '../tools/constants.dart';

class SendMailsUtil {
  static sendShareNotification(String sendTo, String htmlLink) async {
    bool isMailShot = htmlLink.contains("html");
    Map<String, String> headers = new Map();
    String htmlBody = await rootBundle.loadString(htmlLink);

    //headers["Authorization"] = "Bearer SENDGRIDAPIKEY";
    headers["Authorization"] = "Bearer $kSendGridKey";
    headers["Content-Type"] = "application/json";
    final bodyJ = {
      "personalizations": [
        {
          "to": [
            {"email": sendTo, "name": "M&A Technology"}
          ],
          "subject": "Mail from M&A TCEA app"
        }
      ],
      "content": [
        {
          "type": "text/plain",
          "value": isMailShot
              ? 'M&A TCEA\n'
              : 'you can visit a website from here\n ${Uri.encodeFull(htmlLink)}'
        },
        {"type": "text/html", "value": isMailShot ? htmlBody : "\nM&A TCEA\n"}
      ],
      "from": {"email": "info@macomp.com", "name": "macomp"},
      "reply_to": {"email": "info@macomp.com", "name": "macomp"}
    };
    const String urlSTr = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(Uri.parse(urlSTr),
        headers: headers, body: json.encode(bodyJ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static sendRegistrationNotification(String sendTo) async {
    Map<String, String> headers = new Map();
    String link = "https://www.linkedin.com/company/m&a-technology/";

    //headers["Authorization"] = "Bearer SENDGRIDAPIKEY";
    headers["Authorization"] = "Bearer $kSendGridKey";
    headers["Content-Type"] = "application/json";
    final bodyJ = {
      "personalizations": [
        {
          "to": [
            {"email": sendTo, "name": "M&A Technology"}
          ],
          "subject": "Thank you for your registration!"
        }
      ],
      "content": [
        {
          "type": "text/plain",
          "value": '${kRegisterText},\n ${Uri.encodeFull(link)}'
        },
      ],
      "from": {"email": "info@macomp.com", "name": "macomp"},
      "reply_to": {"email": "info@macomp.com", "name": "macomp"}
    };
    const String urlSTr = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(Uri.parse(urlSTr),
        headers: headers, body: json.encode(bodyJ));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
