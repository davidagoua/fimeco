import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:line_icons/line_icon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/enregistrement_controller.dart';

class EnregistrementView extends GetView<EnregistrementController> {
  const EnregistrementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder();
    final _textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.red500,
        title: const Text('EnregistrementView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: VStack([
          TextFormField(
            controller: controller.prenomsCtrl,
            decoration: InputDecoration(
                labelText: "Prénoms", hintText: "Prénoms", border: border),
          ),
          5.heightBox,
          Obx(() => TextFormField(
            controller: controller.nomCtrl.value,
            onChanged: (value)=>{
              controller.nomFamilleCtrl.value.text = value
            },
            decoration: InputDecoration(
                labelText: "Nom", hintText: "Nom", border: border),
          )),
          5.heightBox,
          Obx(()=>TextFormField(
            controller: controller.nomFamilleCtrl.value,
            decoration: InputDecoration(
                labelText: "Nom de la famille",
                hintText: "Nom de la famille",
                border: border),
          )),
          5.heightBox,
          InputDatePickerFormField(
            onDateSaved: controller.date_naissance,
            firstDate: DateTime.now().subtract(Duration(days: 160 * 365)),
            lastDate: DateTime.now().add(Duration(days: 160 * 365)),
            fieldLabelText: "Date de naissance",
          ),
          5.heightBox,
          TextFormField(
            decoration: InputDecoration(
                labelText: "Lieu de naissance",
                hintText: "Lieu de naissance",
                border: border),
          ),
          5.heightBox,
          TextFormField(
            decoration: InputDecoration(
                labelText: "Profession / Occupation", border: border),
          ),
          5.heightBox,
          TextFormField(
            decoration:
                InputDecoration(labelText: "Numero Fimeco", border: border),
          ),
          20.heightBox,
          "Souscription".text.size(17).make(),
          10.heightBox,
          SizedBox(
            height: 100,
            child: Row(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Montant de la soucription personnelle",
                      border: border),
                ).expand(flex: 2),
                5.widthBox,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Année de souscription", border: border),
                ).expand(flex: 1),
              ],
            ),
          ),
          20.heightBox,
          "Eglise locale".text.size(17).make(),
          10.heightBox,
          InkWell(
            child: Container(
              child: Obx(() => controller.selectedValue.value != ""
                  ? "${controller.selectedValue.value}".text.make()
                  : "Selectionner l'église local".text.make()),
            ),
            onTap: () => Get.bottomSheet(_bottomSheetEglise()),
          ),
          30.heightBox,
          GFButton(
            onPressed: controller.validate(),
            shape: GFButtonShape.square,
            size: GFSize.LARGE,
            color: Vx.red700,
            textColor: Vx.white,
            text: "Enregistrer",
          ).w(double.maxFinite)
        ]).p(10).scrollVertical(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.pickImage,
        backgroundColor: Vx.red500,
        child: LineIcon.camera(),
      ),
    );
  }

  Widget _bottomSheetEglise() {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Obx(() => VStack([
            TextFormField(
              onChanged: (value) => {controller.selectedValue.value = value},
              decoration: InputDecoration(
                  labelText: "Rechecher", border: OutlineInputBorder()),
            ).expand(flex: 1),
            ListView(
              children: controller.egliseLocales
                  .where((p0) =>
                      p0.toLowerCase().contains(controller.selectedValue.value))
                  .map((e) => ListTile(
                        onTap: () {
                          controller.selectedValue.value = e;
                          Get.back();
                        },
                        title: e.text.make(),
                      ))
                  .toList(),
            ).expand(flex: 3)
          ])),
    ).w(double.maxFinite).h(Get.height * 10 / 4);
  }
}
