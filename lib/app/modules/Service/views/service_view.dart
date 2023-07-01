import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes/app_pages.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {



  const ServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: VStack([
          Container(
            decoration: BoxDecoration(
                color: Vx.red800
            ),
            padding: EdgeInsets.all(10),
            child: ZStack([
              VStack([
                CircleAvatar(radius: 35, backgroundColor: Colors.white, child: LineIcon.user(color: Vx.red800, size: 40,),),
                10.heightBox,
                "Jean Martial After".text.size(20).color(Vx.white).textStyle(GoogleFonts.aBeeZee()).make(),
                10.heightBox,
                [
                  "20 familles".text.size(18).color(Vx.white).make(),
                  "|".text.make().marginSymmetric(horizontal: 5),
                  "10 membres".text.size(18).color(Vx.white).make()
                ].hStack(),
              ], crossAlignment: CrossAxisAlignment.center, alignment: MainAxisAlignment.spaceBetween,).w(double.maxFinite)
            ]),
          ).card.rounded.make().w(double.maxFinite).marginAll(10),



          Expanded(child: Container(
            height: double.maxFinite,
            color: Vx.white,
            child: VStack([
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Vx.red500,),
                  borderRadius: BorderRadius.circular(7),
                  color: Vx.red50,
                ),
                child: ListTile(
                  onTap: ()=>{
                    Get.toNamed(Routes.ENREGISTREMENT)
                  },
                  leading: LineIcon.users(size: 50, color: Vx.red500,),
                  title: "Enregistrer une famille".text.size(22).center.make(),
                  subtitle: "Enregistrer toute la famille".text.center.color(Vx.gray500).make(),
                ).p(10),
              ),
              10.heightBox,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Vx.red500,),
                  borderRadius: BorderRadius.circular(7),
                  color: Vx.red50,
                ),
                child: ListTile(
                  leading: LineIcon.user(size: 50, color: Vx.red500,),
                  title: "Enregistrer un membre".text.size(22).center.make(),
                  subtitle: "Enregistrer un membre dans une famille".text.center.color(Vx.gray500).make(),
                ).p(10),
              ),
              10.heightBox,
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Vx.red500,),
                    borderRadius: BorderRadius.circular(7),
                    color: Vx.red50,
                  ),
                  child: ListTile(
                    leading: LineIcon.penSquare(size: 50, color: Vx.red500,),
                    title: "Mes Enregistrements".text.size(22).center.make(),
                    subtitle: "Tous les enregistrements non synchronisés".text.center.color(Vx.gray500).make(),
                  ).p(10),
                ),
              )


            ], alignment: MainAxisAlignment.center,).p(10),
          ).card.topRounded().make(), flex: 1,)
        ]),
      ),
    );
  }
}
