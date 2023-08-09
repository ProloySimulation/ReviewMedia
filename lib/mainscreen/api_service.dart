import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:review/network/apiEndPoints.dart';
import 'package:review/util/SharedPreferences.dart';

class ApiService{
  static Future postReview(String companyName,String reviewDetail,String location,List<String> tags) async
  {
   /* String? token = await getTokenPreferences('USER_TOKEN');

    print("USER: $token");*/
    final Map<String, String> headers = {
      'Authorization': "Bearer 16|8aB5IFTi9msjDZFuiSw3d578TzLCWbe8WQct9kTk",
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'company_name' : companyName,
      'description' : reviewDetail,
      'category' : 'travel',
      'tag' : jsonEncode(tags),
      'lat' : "25.4566",
      'long' : "23.3444",
      'address_details' : location,
      'identity' : "1",
      'review_create' : "create"
    };

    final response = await http.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.newPost),
      headers: headers,
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

  static Future getReview() async
  {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'get_review' : "get",
    };

    final response = await http.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.feedReview),
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