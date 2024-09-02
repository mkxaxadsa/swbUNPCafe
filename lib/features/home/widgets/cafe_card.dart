import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/cafe.dart';

class CafeCard extends StatelessWidget {
  const CafeCard({super.key, required this.cafe});

  final Cafe cafe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 156,
          height: 194,
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: CupertinoButton(
            onPressed: () {
              context.push('/cafe-edit', extra: cafe);
            },
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(cafe.image1),
                    height: 102,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return CachedNetworkImage(
                        imageUrl: cafe.image1,
                        height: 102,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Container();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  cafe.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontFamily: Fonts.extra,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  cafe.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.purple1,
                    fontSize: 13,
                    fontFamily: Fonts.regular,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
