import 'package:category/src/categories/categories_bloc/categories_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_bloc/categories_bloc_bloc.dart';
import 'categories_bloc/categories_bloc_event.dart';
import 'models/item_model.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoriesBlocBloc _categoriesBloc = CategoriesBlocBloc();
  List<Welcome> _dd;
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _categoriesBloc.dispatch(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter lIstwies with json'),
      ),
      body: BlocListener(
        bloc: _categoriesBloc,
        listener: (context, state) {
          print("Current state $state");
          if (state is UpdateItemDisplay) {
            selectedIndex = state.index;
          }
          if (state is LoadedState) {
            _dd = state.welcome;
          }
        },
        child: BlocBuilder(
          bloc: _categoriesBloc,
          builder: (context, state) {
            if (state is LoadingState) {
              //SHOW PROGRESS DIALOG
            }
//            if (state is LoadedState) {
//              return Row(
//                children: [
//                  Expanded(
//                    flex: 3,
//                    child: Container(
//                      //  color: Colors.green,
//                      child: ListView.builder(
//                        itemCount: _dd.first.name.length,
//                        itemBuilder: (context, index) {
//                          return Column(
//                            children: <Widget>[
//                              FlatButton(
//                                onPressed: () {
//                                  _categoriesBloc
//                                      .dispatch(ItemClickedEvent(index));
//                                },
//                                child: Text(
//                                  _dd[index].name,
//                                ),
//                              ),
//                            ],
//                          );
//                        },
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    flex: 7,
//                    child: Text(_dd[selectedIndex].subCategory[0].name),
//                  )
//                ],
//              );
//            }
            return Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    //  color: Colors.green,
                    child: ListView.builder(
                      itemCount: _dd.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                _categoriesBloc
                                    .dispatch(ItemClickedEvent(index));
                              },
                              child: Text(
                                _dd[index].name,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    itemCount: _dd[selectedIndex].subCategory.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Text(
                            _dd[selectedIndex].subCategory[index].name,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
