import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(await Permission.manageExternalStorage.request().isDenied || await Permission.camera.request().isDenied){

  }

  var permissions = await <Permission>[
    Permission.manageExternalStorage,
    Permission.camera,
  ].request();


  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme()
      ),
    ),
  );
}
