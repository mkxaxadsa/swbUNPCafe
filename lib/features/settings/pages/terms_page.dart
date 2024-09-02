import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: 'Terms of Service',
            settings: true,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: const [
                _BodyCard(
                  children: [
                    _TextBold('1. Introduction'),
                    _Text(
                      'Welcome to Sweet Helper Cafe! By accessing or using our mobile application, you agree to comply with and be bound by these Terms of Service ("Terms"). Please read them carefully before using the app. If you do not agree to these Terms, you should not use the app.',
                    ),
                    _TextBold('2. Eligibility'),
                    _Text(
                      'To use Sweet Helper Cafe, you must be at least 13 years old. If you are between 13 and 18 years old, you may only use the app under the supervision of a parent or legal guardian who agrees to be bound by these Terms.',
                    ),
                    _TextBold('3. Account Registration'),
                    _Text(
                      'To access certain features of the app, you may need to create an account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to provide accurate and up-to-date information during registration and to update this information if it changes.',
                    ),
                    _TextBold('4. User Content'),
                    _Text(
                      'You may submit reviews, photos, ratings, and other content ("User Content") to the app. By submitting User Content, you grant Sweet Helper Cafe a non-exclusive, royalty-free, worldwide, transferable, and sublicensable license to use, reproduce, modify, adapt, publish, translate, distribute, and display such content in connection with the app. You are solely responsible for your User Content. You agree not to post any content that is unlawful, defamatory, abusive, harassing, or otherwise objectionable. Sweet Helper Cafe reserves the right to remove any content that violates these Terms or is deemed inappropriate by us.',
                    ),
                    _TextBold('5. Prohibited Activities'),
                    _Text(
                      'You agree not to engage in any of the following activities:\n• Using the app for any illegal or unauthorized purpose.\n• Harassing, threatening, or defaming other users.\n• Posting misleading, false, or inaccurate reviews.\n• Attempting to gain unauthorized access to other users accounts.\n• Interfering with the operation of the app, including hacking, sending spam, or uploading malicious software.',
                    ),
                    _TextBold('6. Intellectual Property'),
                    _Text(
                      'All intellectual property rights in the app, including but not limited to software, design, graphics, and text, are owned by Sweet Helper Cafe or its licensors. You may not copy, modify, distribute, or reverse engineer any part of the app without prior written consent from Sweet Helper Cafe.',
                    ),
                    _TextBold('7. Termination'),
                    _Text(
                      'We reserve the right to terminate or suspend your account at any time, without notice, if you violate these Terms or engage in any activity that is harmful to the app or other users. Upon termination, your right to use the app will cease immediately.',
                    ),
                    _TextBold('8. Disclaimer of Warranties'),
                    _Text(
                      'Sweet Helper Cafe is provided "as is" and "as available" without warranties of any kind, either express or implied. We do not guarantee that the app will be error-free, secure, or uninterrupted. Your use of the app is at your own risk.',
                    ),
                    _TextBold('9. Limitation of Liability'),
                    _Text(
                      'To the fullest extent permitted by law, Sweet Helper Cafe shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the app. Our total liability to you for any claims related to the app shall not exceed the amount you paid to use the app, if any.',
                    ),
                    _TextBold('10. Changes to the Terms'),
                    _Text(
                      'We may update these Terms from time to time. We will notify you of any significant changes by posting the new Terms on the app. Your continued use of the app after the changes take effect indicates your acceptance of the revised Terms.',
                    ),
                    _TextBold('11. Governing Law'),
                    _Text(
                      'These Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.',
                    ),
                    _TextBold('12. Contact Us'),
                    _Text(
                      'If you have any questions about these Terms, please contact us at [Support Email Address].',
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _TextBold extends StatelessWidget {
  const _TextBold(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 12,
          fontFamily: Fonts.bold,
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        height: 1.8,
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: Fonts.medium,
      ),
    );
  }
}


 
// 6. Intellectual Property
// All intellectual property rights in the app, including but not limited to software, design, graphics, and text, are owned by Sweet Helper Cafe or its licensors. You may not copy, modify, distribute, or reverse engineer any part of the app without prior written consent from Sweet Helper Cafe.
// 7. Termination
// We reserve the right to terminate or suspend your account at any time, without notice, if you violate these Terms or engage in any activity that is harmful to the app or other users. Upon termination, your right to use the app will cease immediately.
// 8. Disclaimer of Warranties
// Sweet Helper Cafe is provided "as is" and "as available" without warranties of any kind, either express or implied. We do not guarantee that the app will be error-free, secure, or uninterrupted. Your use of the app is at your own risk.
// 9. Limitation of Liability
// To the fullest extent permitted by law, Sweet Helper Cafe shall not be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the app. Our total liability to you for any claims related to the app shall not exceed the amount you paid to use the app, if any.
// 10. Changes to the Terms
// We may update these Terms from time to time. We will notify you of any significant changes by posting the new Terms on the app. Your continued use of the app after the changes take effect indicates your acceptance of the revised Terms.
// 11. Governing Law
// These Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.
// 12. Contact Us
// If you have any questions about these Terms, please contact us at [Support Email Address].