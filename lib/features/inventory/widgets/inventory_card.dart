import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/inventory.dart';
import '../../../core/widgets/texts/text_b.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({super.key, required this.inventory});

  final Inventory inventory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/inventory/edit', extra: inventory);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.file(
                File(inventory.image),
                fit: BoxFit.cover,
                width: 100,
                errorBuilder: (context, error, stackTrace) {
                  return CachedNetworkImage(
                    imageUrl: inventory.image,
                    fit: BoxFit.cover,
                    width: 100,
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  );
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: TextB(
                inventory.name,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 14),
            SvgPicture.asset('assets/arrow-right.svg'),
          ],
        ),
      ),
    );
  }
}
