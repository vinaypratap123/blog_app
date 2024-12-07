import 'dart:io';

import 'package:blog_app/core/theme/color_constants.dart';
import 'package:blog_app/core/utils/media_picker.dart';
import 'package:blog_app/core/widgets/buttons/custom_button.dart';
import 'package:blog_app/core/widgets/common/custom_sizedbox.dart';
import 'package:blog_app/core/widgets/error/custom_error_snackbar.dart';
import 'package:blog_app/feature/upload/presentation/widgets/blog_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  List<String> selectedTopics = [];
  File? image;

  ///init method
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  ///dispose method
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  ///pic image from camera
  void _picImageFromGallery() async {
    final pickedImage = await picImageFromGallery();
    if (pickedImage != null) {
      image = pickedImage;

      ///update ui
      setState(() {});
    } else {
      if (mounted) {
        customErrorSnackbar(
          context,
          'Plaese pic an image',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ///done button
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomButton(
              btnName: 'Done',
              // btnName: AppLocalizations.of(context)!.logout,
              height: 30,
              width: 90,
              onPressed: () {
                //GoRouter.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// blog type buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['Technology', 'Programming', 'Business', 'Sports']
                      .map(
                        (topic) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {
                              if (selectedTopics.contains(topic)) {
                                selectedTopics.remove(topic);
                              } else {
                                selectedTopics.add(topic);
                              }
                              setState(() {});
                            },
                            child: Chip(
                              color: selectedTopics.contains(topic)
                                  ? const WidgetStatePropertyAll<Color>(
                                      ColorConstants.tealGreen,
                                    )
                                  : null,
                              label: Text(
                                topic,
                                style: TextStyle(
                                  color: selectedTopics.contains(topic)
                                      ? ColorConstants.whiteColor
                                      : ColorConstants.blackColor,
                                ),
                              ),
                              side: selectedTopics.contains(topic)
                                  ? null
                                  : const BorderSide(
                                      color: ColorConstants.blackColor,
                                    ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const CustomSizedBox(
                height: 15,
              ),

              /// pic image container
              image != null
                  ? InkWell(
                      onTap: () {
                        _picImageFromGallery();
                      },
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : DottedBorder(
                      borderType: BorderType.RRect,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      color: ColorConstants.greyColor,
                      child: InkWell(
                        onTap: () {
                          _picImageFromGallery();
                        },
                        child: const SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder_open,
                              ),
                              CustomSizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select your image',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              const CustomSizedBox(
                height: 15,
              ),

              ///blog title text field
              BlogTextField(
                controller: titleController,
                hintText: 'Blog Title',
                minLines: 1,
              ),
              const CustomSizedBox(
                height: 15,
              ),

              ///blog content text field
              BlogTextField(
                controller: contentController,
                hintText: 'Blog Content',
                minLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
