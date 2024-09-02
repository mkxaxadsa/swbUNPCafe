import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/inventory.dart';
import '../../../core/utils.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc() : super(InventoryInitial()) {
    on<GetInventoriesEvent>((event, emit) async {
      if (inventoryList.isEmpty) {
        await getInventories();
        emit(InventoryLoadedState(inventories: inventoryList));
      } else {
        emit(InventoryLoadedState(inventories: inventoryList));
      }
    });

    on<AddInventoryEvent>((event, emit) async {
      inventoryList.add(event.inventory);
      await updateInventories();
      emit(InventoryLoadedState(inventories: inventoryList));
    });

    on<EditInventoryEvent>((event, emit) async {
      for (Inventory inventory in inventoryList) {
        if (inventory.id == event.inventory.id) {
          inventory.name = event.inventory.name;
          inventory.price = event.inventory.price;
          inventory.salePrice = event.inventory.salePrice;
          inventory.image = event.inventory.image;
        }
      }
      await updateInventories();
      emit(InventoryLoadedState(inventories: inventoryList));
    });

    on<DeleteInventoryEvent>((event, emit) async {
      inventoryList.removeWhere((element) => element.id == event.id);
      await updateInventories();
      emit(InventoryLoadedState(inventories: inventoryList));
    });
  }
}
