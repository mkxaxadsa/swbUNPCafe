import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';
import '../utils.dart';
import 'texts/text_b.dart';
import 'texts/text_e.dart';
import 'texts/text_r.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.home = false,
    this.settings = false,
  });

  final String title;
  final bool home;
  final bool settings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12 + getStatusBar(context),
        left: 24,
        right: 24,
      ),
      child: SizedBox(
        // color: Colors.greenAccent,
        height: 64,
        child: Row(
          children: [
            if (home)
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextE2('Welcome!', fontSize: 16),
                  TextR(
                    'Select one of the options',
                    fontSize: 13,
                    color: AppColors.grey1,
                  ),
                ],
              )
            else ...[
              CupertinoButton(
                onPressed: () {
                  context.pop();
                },
                padding: EdgeInsets.zero,
                minSize: 40,
                child: Container(
                  height: 40,
                  width: 93,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.black,
                      ),
                      SizedBox(width: 4),
                      TextB('Back', fontSize: 15),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: TextE2(title, fontSize: 16),
              ),
            ],
            if (!settings) ...[
              if (home) const Spacer(),
              CupertinoButton(
                onPressed: () {
                  context.push('/settings');
                },
                padding: EdgeInsets.zero,
                minSize: 40,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/settings.svg'),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
