import 'package:category/src/categories/models/item_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoriesBlocState {}

class InitialCategoriesBlocState extends CategoriesBlocState {}

class LoadingState extends CategoriesBlocState {}

class ErrorState extends CategoriesBlocState {}

class LoadedState extends CategoriesBlocState {
  final List<Welcome> welcome;

  LoadedState(this.welcome);
}

class UpdateItemDisplay extends CategoriesBlocState {
  final int index;

  UpdateItemDisplay(this.index);
}
