import 'package:fimeco/app/modules/Enregistrement/views/enregistrement_view.dart';
import 'package:fimeco/app/modules/Profile/views/profile_view.dart';
import 'package:fimeco/app/modules/Service/views/service_view.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => IndexedStack(
            index: controller.index(),
            children: [
              ServiceView(),
              EnregistrementView(),
              ProfileView(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: (int value) => controller.index(value),
            currentIndex: controller.index(),
            selectedItemColor: Vx.red500,
            unselectedItemColor: Vx.gray700,
            items: [
              BottomNavigationBarItem(icon: LineIcon.home(), label: "Acceuil"),
              BottomNavigationBarItem(
                  icon: LineIcon.excelFile(), label: "Enregistrement"),
              BottomNavigationBarItem(
                  icon: LineIcon.cogs(), label: "Paramètre"),
              BottomNavigationBarItem(
                  icon: LineIcon.cogs(), label: "Paramètre"),
            ],
          )),
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
              icon: LineIcons.users,
              iconColor: Vx.white,
              title: "Famille",
              onPress: () => {
                controller.scan()
              },
              titleStyle: TextStyle(color: Colors.white),
              bubbleColor: Vx.red500),
          Bubble(
              icon: LineIcons.user,
              iconColor: Vx.white,
              title: "Membre",
              onPress: () => {
                controller.scan()
              },
              titleStyle: TextStyle(color: Colors.white),
              bubbleColor: Vx.red500),
        ],
        animation: controller.animation,
        onPress: () => controller.animationController.isCompleted
            ? controller.animationController.reverse()
            : controller.animationController.forward(),
        iconColor: Vx.red500,
        iconData: LineIcons.plus,
        backGroundColor: Colors.white,
      ),
    );
  }
}
