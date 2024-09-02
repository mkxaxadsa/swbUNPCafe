import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/add_image_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../bloc/news_bloc.dart';

class NewsAddPage extends StatefulWidget {
  const NewsAddPage({super.key});

  @override
  State<NewsAddPage> createState() => _NewsAddPageState();
}

class _NewsAddPageState extends State<NewsAddPage> {
  final controller1 = TextEditingController(); // title
  final controller2 = TextEditingController(); // body
  final controller3 = TextEditingController(); // image 1
  final controller4 = TextEditingController(); // image 2
  final controller5 = TextEditingController(); // image 3
  final controller6 = TextEditingController(); // image 4

  bool active = false;
  bool favorite = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onSave() {
    context.read<NewsBloc>().add(
          AddNewsEvent(
            news: News(
              id: getCurrentTimestamp(),
              title: controller1.text,
              body: controller2.text,
              image: controller3.text,
              image2: controller4.text,
              image3: controller5.text,
              image4: controller6.text,
            ),
          ),
        );
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resize: true,
      body: Column(
        children: [
          const CustomAppbar(title: 'News'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                const TextB('Coffee Shop Photo', fontSize: 14),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  children: [
                    AddImageButton(
                      controller: controller3,
                      onPressed: checkActive,
                    ),
                    if (controller3.text.isNotEmpty) ...[
                      const SizedBox(width: 10),
                      AddImageButton(
                        controller: controller4,
                        onPressed: checkActive,
                      ),
                      if (controller4.text.isNotEmpty) ...[
                        const SizedBox(width: 10),
                        AddImageButton(
                          controller: controller5,
                          onPressed: checkActive,
                        ),
                        if (controller5.text.isNotEmpty) ...[
                          const SizedBox(width: 10),
                          AddImageButton(
                            controller: controller6,
                            onPressed: checkActive,
                          ),
                        ]
                      ]
                    ],
                  ],
                ),
                const SizedBox(height: 24),
                const TextB('Enter the headline of the news', fontSize: 14),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller1,
                  hintText: 'Title',
                  multiline: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextB('Enter the text of the news', fontSize: 14),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller2,
                  hintText: 'Body',
                  multiline: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  title: 'Save',
                  active: active,
                  onPressed: onSave,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
