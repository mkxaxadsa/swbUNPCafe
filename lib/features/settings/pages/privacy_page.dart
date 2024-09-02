import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: 'Privacy Policy',
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
                      'At Sweet Helper Cafe, we are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully to understand our practices regarding your personal data. By using the app, you agree to the collection and use of information in accordance with this Privacy Policy.',
                    ),
                    _TextBold('2. Information We Collect'),
                    _Text(
                        'We collect several types of information from and about users of our app, including:\n• Personal Information: When you create an account or update your profile, we may collect personal details such as your name, email address, phone number, and any other information you provide.\n• Usage Data: We may collect information about how you access and use the app, including your device information, IP address, browser type, operating system, pages visited, and the time and date of your visit.\n• Location Data: With your consent, we may collect and process information about your location to provide location-based services, such as recommending nearby cafés.\n• User Content: We collect the content you submit, including reviews, ratings, comments, and photos.'),
                    _TextBold('3. How We Use Your Information'),
                    _Text(
                        'We may use the information we collect for various purposes, including:\n• To Provide and Improve the App: We use your information to operate, maintain, and improve the app’s functionality and features.\n• To Personalize Your Experience: We may use your data to tailor the app\'s content and recommendations to your preferences and location.\n• To Communicate with You: We may use your contact information to send you updates, promotional materials, or important notices regarding your account or the app.\n• To Ensure Security: We use your information to monitor and improve the security of the app, including detecting and preventing fraud, unauthorized activities, and other harmful behavior.\n• For Analytics: We analyze how users interact with the app to understand trends, user behavior, and to improve our services.'),
                    _TextBold('4. Sharing Your Information'),
                    _Text(
                        'We may share your information with:\n• Service Providers: We may share your data with third-party service providers who assist us in operating the app, such as hosting services, analytics providers, and customer support.\n• Business Transfers: If Sweet Helper Cafe is involved in a merger, acquisition, or sale of assets, your information may be transferred as part of that transaction.\n• Legal Compliance: We may disclose your information to comply with legal obligations, such as responding to subpoenas, court orders, or other legal processes.\n• With Your Consent: We may share your information for other purposes with your explicit consent.'),
                    _TextBold('5. Data Security'),
                    _Text(
                        'We take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, please be aware that no method of transmitting or storing data is completely secure, and we cannot guarantee the absolute security of your information.'),
                    _TextBold('6. Your Choices'),
                    _Text(
                        '• Account Information: You can review and update your account information at any time by accessing your profile settings in the app.\n• Location Data: You can control the app’s access to your location information through your device’s settings.\n• Marketing Communications: You can opt-out of receiving promotional emails by following the unsubscribe instructions provided in the email or by adjusting your account settings.'),
                    _TextBold('7. Children’s Privacy'),
                    _Text(
                        'Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If we learn that we have collected such information, we will take steps to delete it.'),
                    _TextBold('8. International Data Transfers'),
                    _Text(
                        'If you are accessing the app from outside [Your Country/Region], please be aware that your information may be transferred to, stored, and processed in [Your Country/Region], where our servers and central database are located. By using the app, you consent to such transfer.'),
                    _TextBold('9. Changes to This Privacy Policy'),
                    _Text(
                        'We may update this Privacy Policy from time to time. We will notify you of any significant changes by posting the new Privacy Policy on the app. Your continued use of the app after the changes take effect constitutes your acceptance of the revised policy.'),
                    _TextBold('10. Contact Us'),
                    _Text(
                        'If you have any questions or concerns about this Privacy Policy, please contact us at [Support Email Address].'),
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
