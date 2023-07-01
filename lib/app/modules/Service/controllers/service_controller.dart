import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {

  @override
  void onInit() async {


    super.onInit();
  }



  void handleCompletion(DocumentReaderCompletion completion) {
    if (completion.action == DocReaderAction.COMPLETE || completion.action == DocReaderAction.TIMEOUT) {
      // handle results
    }
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
