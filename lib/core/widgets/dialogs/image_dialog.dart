import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/app_colors.dart';
import '../../utils.dart';
import '../textfields/link_field.dart';
import '../texts/text_b.dart';
import '../texts/text_e.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({
    super.key,
    required this.controller,
    required this.onImageLink,
    required this.onImagePicked,
  });

  final TextEditingController controller;
  final void Function(String) onImageLink;
  final void Function(String) onImagePicked;

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  String link = '';
  bool canRemove = false;

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  void onPickImage() async {
    image = await pickImage();
    if (image.path.isNotEmpty) {
      setState(() {});
    }
  }

  void onLink() async {
    if (widget.controller.text.isNotEmpty) {
      link = await filterValidImage(widget.controller.text);
      setState(() {});
    }
  }

  void onSave() {
    if (link.isNotEmpty) {
      widget.onImageLink(link);
    } else {
      widget.onImagePicked(image.path);
    }
    context.pop();
  }

  void onClose() {
    context.pop();
  }

  void onCancel() {
    widget.onImagePicked('');
    setState(() {
      link = '';
      widget.controller.clear();
      image = XFile('');
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      canRemove = true;
      widget.controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 56),
      backgroundColor: AppColors.white,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                CupertinoButton(
                  onPressed: onClose,
                  padding: EdgeInsets.zero,
                  minSize: 32,
                  child: SvgPicture.asset('assets/close.svg'),
                ),
              ],
            ),
            const TextE2('Add New Photo', fontSize: 16),
            const SizedBox(height: 24),
            if (link.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  link,
                  height: 188,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container();
                  },
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 47,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: CupertinoButton(
                  onPressed: onSave,
                  padding: EdgeInsets.zero,
                  minSize: 47,
                  child: const Center(
                    child: TextE2(
                      'Save',
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 47,
                decoration: BoxDecoration(
                  color: AppColors.pink2,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: CupertinoButton(
                  onPressed: onCancel,
                  padding: EdgeInsets.zero,
                  minSize: 47,
                  child: const Center(
                    child: TextE2(
                      'Cancel',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ] else if (image.path.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.file(
                  File(image.path),
                  height: 188,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 47,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: CupertinoButton(
                  onPressed: onSave,
                  padding: EdgeInsets.zero,
                  minSize: 47,
                  child: const Center(
                    child: TextE2(
                      'Save',
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 47,
                decoration: BoxDecoration(
                  color: AppColors.pink2,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: CupertinoButton(
                  onPressed: onCancel,
                  padding: EdgeInsets.zero,
                  minSize: 47,
                  child: const Center(
                    child: TextE2(
                      'Cancel',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ] else ...[
              const TextB('Add Link', fontSize: 14),
              const SizedBox(height: 10),
              LinkField(
                controller: widget.controller,
                onChanged: onLink,
              ),
              const SizedBox(height: 24),
              const TextB('Select from the Gallery', fontSize: 14),
              const SizedBox(height: 10),
              Container(
                height: 47,
                decoration: BoxDecoration(
                  color: AppColors.pink2,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: CupertinoButton(
                  onPressed: onPickImage,
                  padding: EdgeInsets.zero,
                  minSize: 47,
                  child: const Center(
                    child: TextE2(
                      'Select a Photo',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              if (canRemove) ...[
                const SizedBox(height: 10),
                Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: AppColors.pink2,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: CupertinoButton(
                    onPressed: onSave,
                    padding: EdgeInsets.zero,
                    minSize: 47,
                    child: const Center(
                      child: TextE2(
                        'Remove',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ],
        ),
      ),
    );
  }
}
