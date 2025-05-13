import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/features/profile/controller/profile_controller.dart';
import 'package:dummy_project_1/features/profile/screens/updated_profile_screen.dart';
import 'package:dummy_project_1/features/profile/widgets/edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(), // Initializes and registers the controller
      builder: (controller) {
        return Scaffold(
          
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Image Stack
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: Get.height / 8,
                        width: Get.width / 4,
                        child: controller.profileImage.value != null
                            ? Image.file(
                                controller.profileImage.value!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/profile_iamge.jpg",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: InkWell(
                        onTap: () {
                          _showImagePickerOptions(context, controller);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly( top: 10),

                // Text Fields
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditTextField(
                      title: AppText.fullName,
                      controller: controller.fullNameController,
                      hintText: AppText.fullNameHint,
                    ),
                    EditTextField(
                      title: AppText.businessName,
                      controller: controller.businessNameController,
                      hintText: AppText.businessNameHint,
                    ),
                    EditTextField(
                      title: AppText.mail,
                      controller: controller.emailController,
                      hintText: AppText.mailHint,
                    ),
                    EditTextField(
                      title: AppText.mobileNumber,
                      controller: controller.mobileNumberController,
                      hintText: AppText.mobileNumberHint,
                    ),
                    EditTextField(
                      title: AppText.businessLocation,
                      controller: controller.businessLocationController,
                      hintText: AppText.businessLocationHint,
                    ),
                  ],
                ).marginOnly(top: 24),
              Text("Select Service*",  style: TextStyle(fontSize: 12, color:Color(0xFFFF6723)),).paddingOnly(right: 250),
                // Service Selection
                Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile<String>(
                        title: Text(AppText.repairRefrigeration),
                        value: AppText.repairRefrigeration,
                        groupValue: controller.service.value,
                        activeColor: Color(0xFF009DE8), 
                        onChanged: (value) {
                          controller.selectService(value!);
                        },
                      ),
                      RadioListTile<String>(
                        title: Text(AppText.appliance),
                        value: AppText.appliance,
                        groupValue: controller.service.value,
                        activeColor: Color(0xFF009DE8), 
                        onChanged: (value) {
                          controller.selectService(value!);
                        },
                      ),
                      RadioListTile<String>(
                        title: Text(AppText.refrigeration),
                        value: AppText.refrigeration,
                        groupValue: controller.service.value,
                        activeColor: Color(0xFF009DE8), 
                        onChanged: (value) {
                          controller.selectService(value!);
                        },
                      ),
                    ],
                  );
                }),

                // Service Area Input
                EditTextField(
                  marginBottom: 0,
                  title: AppText.serviceAreaTitle,
                  controller: controller.serviceAreaController,
                  hintText: AppText.serviceAreaTitle,
                  suffix: InkWell(
                    onTap: () => controller.addServiceArea(
                      controller.serviceAreaController.text,
                    ),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.success.withAlpha(50),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check, color: AppColors.success),
                    ).marginOnly(bottom: 10),
                  ),
                ).marginOnly(bottom: 8),

                // Service Area Chips
                Obx(() {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.serviceArea
                        .map((e) => Chip(
                              label: Text(e),
                              onDeleted: () => controller.removeServiceArea(e),
                              deleteIcon: Icon(Icons.close, size: 15),
                            ))
                        .toList(),
                  );
                }),
             InkWell(
              onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UpdatedProfileScreen(),
        ),
      ),
              child: CustomSubmitButton(hintText: "Submit"))
             
              ],
              
            ).marginSymmetric(horizontal: 16),
            
          ),
        );
      },
    );
  }

  void _showImagePickerOptions(BuildContext context, ProfileController controller) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text('Choose an option'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              controller.pickImageFromGallery();
              Get.back();
            },
            child: Text('Pick from Gallery'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              controller.pickImageFromCamera();
              Get.back();
            },
            child: Text('Take a Photo'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: Get.back,
          child: Text('Cancel'),
        ),
      ),
    );
  }
}