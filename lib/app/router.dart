import 'package:flutter/material.dart';
import 'package:hasta_rental/screen/customer_profile_screen/customer_profile.dart';

const String homeRoute = '/login';
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String customerRout = '/customer';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
    case loginRoute:
    case signupRoute:
      return CustomerProfile.route();
  }
  return null;
}
