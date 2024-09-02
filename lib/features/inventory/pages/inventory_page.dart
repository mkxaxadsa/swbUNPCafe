import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/inventory.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../bloc/inventory_bloc.dart';
import '../widgets/inventory_card.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key, required this.category});

  final String category;

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<Inventory> getSorted(List<Inventory> data) {
    List<Inventory> sorted = [];
    for (Inventory inventory in data) {
      if (inventory.category == widget.category) {
        sorted.add(inventory);
      }
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CustomAppbar(title: widget.category),
              const SizedBox(height: 12),
              BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context, state) {
                  if (state is InventoryLoadedState) {
                    if (getSorted(state.inventories).isEmpty) {
                      return const NoData(expanded: true);
                    }

                    return Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          ...List.generate(
                            getSorted(state.inventories).length,
                            (index) {
                              return InventoryCard(
                                inventory: getSorted(state.inventories)[index],
                              );
                            },
                          ),
                          const SizedBox(height: 124),
                        ],
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
          Positioned(
            right: 24,
            bottom: 56 + getBottom(context),
            child: PrimaryButton(
              title: '+ New Product',
              width: 165,
              onPressed: () {
                context.push('/inventory/add', extra: widget.category);
              },
            ),
          ),
        ],
      ),
    );
  }
}
