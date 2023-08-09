import 'package:flutter/material.dart';

class ApiEndPoints {
  static const String baseUrl = 'https://api.simulationtech.net/api/user';
  static const String signUp = '/register'; // Replace with your login API endpoint
  static const String otpVerification = '/verify-email';
  static const String newPost = '/reviewCreate';
  static const String feedReview = '/getReviewData';
  static const String getProfile = '/loggedUser';
// Add more API endpoints as needed
}