import 'package:einkaufszettel/_models/CRUDModel.dart';
import 'package:einkaufszettel/item_list/api/api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('zettel_items'));
  locator.registerLazySingleton(() => CRUDModel());
}