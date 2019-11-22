import 'package:category/nextitem.dart';
import 'package:category/nextpage.dart';
import 'package:category/nextprod.dart';
import 'package:category/src/categories/categories_bloc/categories_bloc_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_bloc/categories_bloc_bloc.dart';
import 'categories_bloc/categories_bloc_event.dart';
import 'models/item_model.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  CategoriesBlocBloc _categoriesBloc = CategoriesBlocBloc();
  List<Welcome> _dd;
  var selectedIndex = 0;

  var againselectedIndex = 0;
  var app = 0;
  @override
  void initState() {
    super.initState();
    _categoriesBloc.dispatch(LoadData());
    app = selectedIndex;
  }

  _buildExpandableContent(List<SubCategory> dd) {
    List<Widget> columnContent = [];
    for (int i = 0; i < dd.length; i++) {
      columnContent.add(
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Next(dd[i].name)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    dd[i].img,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: new Text(
                    dd[i].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.brown[200]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return columnContent;
  }

  @override
  Widget build(BuildContext context) {
    print("ho:$selectedIndex");
    return (BlocListener(
      bloc: _categoriesBloc,
      listener: (context, state) {
        print("Current state $state");
        if (state is UpdateItemDisplay) {
          _dd[state.index].subCategory.length == 0
              ? Navigator.push(context, MaterialPageRoute(builder: (context)=>NextPro(_dd[state.index].name)))
              : selectedIndex = state.index;
        }
        if (state is UpdateAgainItemDisplay) {
          againselectedIndex = state.index;
          print(againselectedIndex);
        }
        if (state is LoadedState) {
          _dd = state.welcome;
        }
        if (state is LoadingState) {
          CircularProgressIndicator();
        }
      },
      child: BlocBuilder(
        bloc: _categoriesBloc,
        builder: (context, state) {
          if (state is LoadingState)
            return Container(
              child: Center(child: CircularProgressIndicator()),
              decoration: BoxDecoration(color: Colors.white),
            );
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  _dd[selectedIndex].name,
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                backgroundColor: Colors.white70,
              ),
              body: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          border: Border(
                            right: BorderSide(width: 0, color: Colors.black12),
                          )),
                      child: ListView.builder(
                        itemCount: _dd.length,
                        itemBuilder: (context, index) {
                          print(
                              "TEST 9 ${_dd[selectedIndex].subCategory.length}");
                          return Column(
                            children: <Widget>[
                              new SizedBox(
                                width: 115,
                                height: 58,
                                child: FlatButton(
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.brown[50],
                                  onPressed: () {
                                    _categoriesBloc
                                        .dispatch(ItemClickedEvent(index));
                                  },
                                  child: Text(
                                    _dd[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: index == selectedIndex
                                            ? Colors.orange
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  //_dd[selectedIndex].subCategory.length == 0
                    //  ? NextPro(_dd[selectedIndex].name)
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>NextPro(_dd[selectedIndex].name)))
                       Expanded(
                          flex: 7,
                          child: Container(
                            decoration: BoxDecoration(border: Border()),
                            child: ListView.builder(
                              itemCount: _dd[selectedIndex].subCategory.length,
                              itemBuilder: (context, index) {
                                print("TEST  ${_dd[selectedIndex].toJson()}");
                                print("TEST 0  ${index}");
                                print(
                                    "TEST 1  ${_dd[selectedIndex].subCategory.length}");

                                print(
                                    "TEST 3  ${_dd[selectedIndex].subCategory[index].subCategory}");
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 0, color: Colors.black12),
                                  )),
                                  child: _dd[selectedIndex]
                                              .subCategory[index]
                                              .subCategory
                                              .length ==
                                          0
                                      ? GestureDetector(
                                          onTap: () {
                                            String cc = _dd[selectedIndex]
                                                .subCategory[index]
                                                .name;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Nextitem(cc)));
                                          },
                                          child: Container(
                                            height: 58,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 18, 0, 0),
                                                child: Text(
                                                  _dd[selectedIndex]
                                                      .subCategory[index]
                                                      .name,
                                                  textAlign: TextAlign.left,
                                                )),
                                          ),
                                        )
                                      : ExpansionTile(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                child: Text(
                                                  _dd[selectedIndex]
                                                      .subCategory[index]
                                                      .name,
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          children: <Widget>[
                                            _dd[selectedIndex]
                                                        .subCategory[index]
                                                        .subCategory
                                                        .length ==
                                                    0
                                                ? Container()
                                                : new GridView.count(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    crossAxisCount: 3,
                                                    mainAxisSpacing: 2,
                                                    crossAxisSpacing: 8,
                                                    //   gridDelegate:
                                                    //     new SliverGridDelegateWithFixedCrossAxisCount(
                                                    //       crossAxisCount: 2),
                                                    childAspectRatio:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.1),
                                                    children:
                                                        _buildExpandableContent(
                                                            _dd[selectedIndex]
                                                                .subCategory[
                                                                    index]
                                                                .subCategory),
                                                  ),
                                          ],
                                        ),
                                );

                                //return Column(
                                // children: <Widget>[

                                //  expan(_dd[selectedIndex].subCategory[index].name,_dd[selectedIndex].subCategory[index].subCategory).map((expansionTile) => expansionTile).toList(),
                                /* FlatButton(
                            onPressed: () {
                              print("index");
                              _categoriesBloc.dispatch(
                                  ItemAgainClickedEvent(index));
                            },
                            child: Text(
                              _dd[selectedIndex].subCategory[index].name,
                            ),
                          ),*/
                                // ],
                                //);
                              },
                            ),
                          ),
                        ),
                  /*  Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: _dd[selectedIndex]
                        .subCategory[againselectedIndex]
                        .subCategory
                        .length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              _dd[selectedIndex]
                                  .subCategory[againselectedIndex]
                                  .subCategory[index]
                                  .name,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )*/
                ],
              ));
        },
      ),
    ));
  }
}
