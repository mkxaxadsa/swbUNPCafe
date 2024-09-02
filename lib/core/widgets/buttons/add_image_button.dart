import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../config/app_colors.dart';
import '../dialogs/image_dialog.dart';
import '../texts/text_b.dart';

class AddImageButton extends StatefulWidget {
  const AddImageButton({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final void Function() onPressed;

  @override
  State<AddImageButton> createState() => _AddImageButtonState();
}

class _AddImageButtonState extends State<AddImageButton> {
  void onImageLink(String image) {
    widget.controller.text = image;
    widget.onPressed();
  }

  void onImagePicked(String image) {
    widget.controller.text = image;
    setState(() {});
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return ImageDialog(
              controller: widget.controller,
              onImageLink: onImageLink,
              onImagePicked: onImagePicked,
            );
          },
        );
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.controller.text.isNotEmpty)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.file(
                    File(widget.controller.text),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return CachedNetworkImage(
                        imageUrl: widget.controller.text,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Container();
                        },
                      );
                    },
                  ),
                ),
              )
            else
              const Center(
                child: TextB(
                  '+',
                  fontSize: 14,
                  color: AppColors.textField,
                ),
              )
          ],
        ),
      ),
    );
  }
}
