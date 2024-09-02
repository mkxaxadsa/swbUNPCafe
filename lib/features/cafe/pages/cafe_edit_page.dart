import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/cafe.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/add_image_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../bloc/cafe_bloc.dart';
import '../widgets/cafe_favorite_button.dart';
import '../widgets/country_select.dart';

class CafeEditPage extends StatefulWidget {
  const CafeEditPage({super.key, required this.cafe});

  final Cafe cafe;

  @override
  State<CafeEditPage> createState() => _CafeEditPageState();
}

class _CafeEditPageState extends State<CafeEditPage> {
  final controller1 = TextEditingController(); // coffee shop
  final controller2 = TextEditingController(); // country
  final controller3 = TextEditingController(); // address
  final controller4 = TextEditingController(); // notes
  final controller5 = TextEditingController(); // image 1
  final controller6 = TextEditingController(); // image 2
  final controller7 = TextEditingController(); // image 3
  final controller8 = TextEditingController(); // image 4

  bool active = true;
  bool favorite = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
        controller4,
        controller5,
      ]);
    });
  }

  void onSelectCountry(String value) {
    controller2.text = value;
    checkActive();
  }

  void onFavorite() {
    setState(() {
      favorite = !favorite;
    });
  }

  void onEdit() {
    context.read<CafeBloc>().add(
          EditCafeEvent(
            cafe: Cafe(
              id: widget.cafe.id,
              name: controller1.text,
              country: controller2.text,
              address: controller3.text,
              note: controller4.text,
              favorite: favorite,
              image1: controller5.text,
              image2: controller6.text,
              image3: controller7.text,
              image4: controller8.text,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: 'Delete Cafe?',
          onYes: () {
            context.read<CafeBloc>().add(DeleteCafeEvent(id: widget.cafe.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.cafe.name;
    controller2.text = widget.cafe.country;
    controller3.text = widget.cafe.address;
    controller4.text = widget.cafe.note;
    controller5.text = widget.cafe.image1;
    controller6.text = widget.cafe.image2;
    controller7.text = widget.cafe.image3;
    controller8.text = widget.cafe.image4;
    favorite = widget.cafe.favorite;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resize: true,
      body: Column(
        children: [
          const CustomAppbar(title: 'Add Coffee Shop'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const TextB('Coffee Shop Photo', fontSize: 14),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  children: [
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
                      if (controller6.text.isNotEmpty) ...[
                        const SizedBox(width: 10),
                        AddImageButton(
                          controller: controller7,
                          onPressed: checkActive,
                        ),
                        if (controller7.text.isNotEmpty) ...[
                          const SizedBox(width: 10),
                          AddImageButton(
                            controller: controller8,
                            onPressed: checkActive,
                          ),
                        ]
                      ]
                    ],
                  ],
                ),
                const SizedBox(height: 24),
                const TextB('Name of the Coffee Shop', fontSize: 14),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller1,
                  hintText: 'Coffee Shop',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextB('Enter the Country', fontSize: 14),
                const SizedBox(height: 10),
                CountrySelect(onSelect: onSelectCountry),
                const SizedBox(height: 24),
                const TextB('Enter the Address', fontSize: 14),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller3,
                  hintText: 'Address',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextB('Enter the Notes', fontSize: 14),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller4,
                  hintText: 'Enter Text Here',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                CafeFavoriteButton(
                  active: favorite,
                  onPressed: onFavorite,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  title: 'Edit',
                  active: active,
                  onPressed: onEdit,
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  title: 'Delete',
                  onPressed: onDelete,
                ),
                SizedBox(height: 75 + getBottom(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
