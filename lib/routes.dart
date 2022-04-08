import 'package:wieat/home/home.dart';

import 'package:wieat/camera/camera.dart';
import 'package:wieat/camera/processing.dart';
import 'package:wieat/search/search.dart';
import 'package:wieat/login/login.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/camera': (context) => const CameraScreen(),
  '/processing': (context) => const ProcessingScreen(),
  '/search': (context) => SearchScreen(),
  '/login': (context) => const LoginScreen(),
};
