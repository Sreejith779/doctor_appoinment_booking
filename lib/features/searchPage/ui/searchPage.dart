import 'package:doctor_appoinment_booking/utils/textThemes/textThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
 searchBloc.add(SearchInitialEvent());
    super.initState();
  }
  SearchBloc searchBloc = SearchBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        switch(state.runtimeType){
          case SearchLoadedState:
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Color(0xFF8AB8FC),
                    title: Text(
                      "All doctors",
                      style: TextThemes.subHeadingTitle
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                    centerTitle: true,
                    pinned: true,
                  ),
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Color(0xFF8AB8FC),
                    title: searchBar(),
                    expandedHeight: 80,
                  ),

                  SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                return Text("data");
                              }),
                        )
                      ]))
                ],
              ),
            );

          default:
            return Center(child: Text("error"));

        }

      },
    );
  }

  searchBar() {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(18)),
      child: TextField(
        onChanged: (value) {
          setState(() {});
        },
        decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
            hintText: "Search Hospitals",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
