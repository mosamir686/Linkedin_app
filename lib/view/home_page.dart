import 'package:Blog_app/controller/controller.dart';

import 'package:Blog_app/view/res/color_manager.dart';
import 'package:Blog_app/view/res/extension.dart';
import 'package:Blog_app/view/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorManager.primary,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Linked',
              style: TextStyle(
                  color: ColorManager.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'in',
              style: TextStyle(
                  color: ColorManager.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: (Icon(
                Icons.message_rounded,
                color: ColorManager.blackColor,
              )))
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.postList.value.length,
          itemBuilder: (context, i) {
            return Card(
              margin: const EdgeInsets.only(bottom: 20, right: 8, left: 8),

              // margin: EdgeInsets.all(MediaQuery.sizeOf(context).width/50),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: i.isEven
                        ? ColorManager.primary.withOpacity(0.5)
                        : ColorManager.blackColor.withOpacity(0.5),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.mh,
                  Row(
                    children: [
                      16.mw,
                      const CircleAvatar(
                        radius: 20,
                      ),
                      16.mw,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          16.mw,
                          Text(
                            controller.postList.value[i].nameOfUser,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          20.mw,
                          Text(
                            '@${controller.postList.value[i].username}',
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      controller.postList.value[i].title,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      controller.postList.value[i].body,
                      style: TextStyle(
                          color: ColorManager.textColor.withOpacity(0.7),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          icon: controller.postList.value[i].isLiked.value
                              ? Icon(Icons.handshake,
                                  size: 25, color: ColorManager.primary)
                              : Icon(Icons.handshake_outlined,
                                  size: 25,
                                  color: ColorManager.primary.withOpacity(0.7)),
                          isLiked: controller.postList.value[i].isLiked.value,
                          onClickListener: () =>
                              controller.toggle(controller.postList.value[i]),
                        ),
                        CustomTextButton(
                          icon: Icon(
                            Icons.mode_comment,
                            size: 25,
                            color: ColorManager.primary.withOpacity(0.7),
                          ),
                          isLiked: false,
                          onClickListener: () {
                            controller
                                .getComments(controller.postList.value[i].id);
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(AppSiz.s10)),
                              ),
                              context: context,
                              builder: (c) {
                                return Obx(
                                  () => Container(
                                    height: MediaQuery.sizeOf(context).height,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    child: ListView.separated(
                                        itemBuilder: (_, i) {
                                          return ListTile(
                                            title: Text(
                                              controller
                                                  .commentList.value[i].name,
                                            ),
                                            subtitle: Text(
                                              controller
                                                  .commentList.value[i].body,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_, i) {
                                          return Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            height: 5,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 5),
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          );
                                        },
                                        itemCount: controller
                                            .commentList.value.length),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
