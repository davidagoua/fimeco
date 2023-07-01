import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api/document_reader.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/scan_result_controller.dart';

class ScanResultView extends GetView<ScanResultController> {
  const ScanResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanResultView'),
        centerTitle: true,
      ),
      body: Obx(()=> controller.results().isEmpty ? CircularProgressIndicator() : VStack(
        controller.results().map(( e) => ListTile(
          title: Text(e.fieldName),
          subtitle: Text(e.value.toString() ?? ""),
        )).toList()
      ).scrollVertical()),
    );
  }
}
