import 'package:flutter/material.dart';
import 'package:fyp1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // // Check if the user is authenticated with Supabase
    // final currentUser = SupabaseAuth.instance.currentUser;
    // if (currentUser != null ) {

    //   return null;
    // } else {
    //   // If not authenticated and not navigating to login, redirect to login
    //   return Routes.HOME;
    // }
    return null;
  }
}
