import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:review/network/apiEndPoints.dart';

class ApiService{
  static Future signUp(String name,String email) async
  {
    final Map<String, String> body = {
      'name' : name,
      'email' : email,
      'register' : "hit_register",
  };

  final response = await http.post(
  Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.signUp),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
  // Successful API call, parse and return the response data
  return jsonDecode(response.body);
  } else {
  // API call failed, handle the error or return null
  return null;
  }
  }

  static Future otpVerification(String otp) async
  {
    final Map<String, String> body = {
      'otp' : otp,
      'verify' : 'verify_it',
    };

    final response = await http.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.otpVerification),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successful API call, parse and return the response data
      return jsonDecode(response.body);
    } else {
      // API call failed, handle the error or return null
      return null;
    }
  }


}