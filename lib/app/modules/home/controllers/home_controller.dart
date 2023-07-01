import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin  {
  //TODO: Implement HomeController

  final index = 0.obs;
  late Animation<double>  animation;
  late AnimationController animationController;
  @override
  void onInit() async {


    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    setupDocumentReader();
  }

  void setupDocumentReader() async {
    DocumentReader.runAutoUpdate("Full").then((s) {
      // do something
    }).catchError(
            (Object error) => print((error as PlatformException).message));

    ByteData byteData = await rootBundle.load("regula.license");

    DocumentReader.initializeReader({
      "license": base64.encode(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes))
    }).then((s) {
      print(s);
    }).catchError((Object error) {
      print((error as PlatformException).message);
    });

    DocumentReader.setConfig({
      "processParams": {"scenario": ScenarioIdentifier.SCENARIO_OCR},
      "functionality": {"videoCaptureMotionControl": true,  "showCaptureButton": true}
    });

  }

  void scan(){
    print("a scan");
    DocumentReader.showScanner();
    EventChannel('flutter_document_reader_api/event/completion')
        .receiveBroadcastStream()
        .listen((jsonString) => this.handleCompletion(
        DocumentReaderCompletion.fromJson(json.decode(jsonString))));

    print("z scan");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleCompletion(DocumentReaderCompletion? completion) {
    if (completion!.action == DocReaderAction.COMPLETE || completion.action == DocReaderAction.TIMEOUT) {
      print(completion.results?.graphicResult);
      Get.toNamed(Routes.SCAN_RESULT, arguments: completion.results?.textResult?.fields,);
    }
  }
}
