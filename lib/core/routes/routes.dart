import 'package:flutter/material.dart';
import 'package:flutter_frontend_test/ui/pages/editProfile/edit_profile_page.dart';
import 'package:flutter_frontend_test/ui/pages/homepage/home_page.dart';
import 'package:flutter_frontend_test/ui/pages/register/register_page.dart';

Map<String, Widget Function(BuildContext)> getAplicationRoutes = {
  'register': (_) => RegisterPage(),
  'home': (_) => HomePage(),
  'edit_profile': (_) => EditProfilePage(),
};
