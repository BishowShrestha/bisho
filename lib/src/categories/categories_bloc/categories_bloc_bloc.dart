import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category/src/categories/models/item_model.dart';
import 'package:category/src/categories/resources/api_provider.dart';

import './bloc.dart';

class CategoriesBlocBloc
    extends Bloc<CategoriesBlocEvent, CategoriesBlocState> {
  @override
  CategoriesBlocState get initialState => InitialCategoriesBlocState();

  @override
  Stream<CategoriesBlocState> mapEventToState(
    CategoriesBlocEvent event,
  ) async* {
    if (event is LoadData) {
      yield LoadingState();
      ApiProvider _apiProvider = ApiProvider();
      List<Welcome> welcome = await _apiProvider.fetchNotes();
      if (welcome is List<Welcome>)
        yield LoadedState(welcome);
      else
        yield ErrorState();
    }
    if (event is ItemClickedEvent) {
      yield UpdateItemDisplay(event.index);
    }
  }
}
