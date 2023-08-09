import 'package:flutter/material.dart';
import 'package:review/network/apiEndPoints.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService
{
  static Future getProfile() async
  {
    final Map<String, String> headers = {
      'Authorization': "Bearer 16|8aB5IFTi9msjDZFuiSw3d578TzLCWbe8WQct9kTk",
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'logged_user' : "show_user",
    };

    final response = await http.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.getProfile),
      headers: headers,
      body: jsonEncode(body),
    );

    if(response.statusCode == 200)
    {
      return jsonDecode(response.body);
    }
    else
    {
      return null;
    }
  }
}