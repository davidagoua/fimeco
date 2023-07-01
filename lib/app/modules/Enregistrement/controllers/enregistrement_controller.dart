import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EnregistrementController extends GetxController {
  //TODO: Implement EnregistrementController

  final count = 0.obs;
  final formKey = GlobalKey<FormState>();
  final selectedValue = ''.obs;
  late final  egliseLocales = <String>[
    'Emmanuel', 'Bethlehem', 'Bethanie'
  ].obs;
  final egliseTextEditingCtrl = TextEditingController();
  final nomCtrl = TextEditingController().obs;
  final prenomsCtrl = TextEditingController();
  final datenaissanceCtrl = TextEditingController();
  final lieunaissanceCTrl =  TextEditingController();
  final occupationCtrl = TextEditingController();
  final egliseLocalCtrl = TextEditingController();
  final montantfimecoCtrl = TextEditingController();
  final numerofimecoCtrl = TextEditingController();
  final anneesouscriptionCtrl = TextEditingController();
  final nomFamilleCtrl = TextEditingController().obs;
  final date_naissance = DateTime(2023).obs;
  late final ImagePicker imagePicker;


  @override
  void onInit() {
    super.onInit();
    this.imagePicker = ImagePicker();
    setupDocumentReader();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  validate(){
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

  void pickImage() async {
    final response = await this.imagePicker.pickImage(source: ImageSource.camera);
  }

  handleCompletion(DocumentReaderCompletion? data ){
    print(data);
  }
}
