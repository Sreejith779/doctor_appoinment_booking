import 'package:doctor_appoinment_booking/models/hospitalList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/doctorsModel.dart';
import '../../../utils/textThemes/textThemes.dart';
import '../../doctorDetailPage/doctorDetailPage.dart';
import '../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc _searchBloc = SearchBloc();

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc()..add(SearchInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchBloc,
      child: Scaffold(
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchLoadedState) {
              final loadedState = state as SearchLoadedState;

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: const Color(0xFF8AB8FC),
                    title: Text(
                      "All doctors",
                      style: TextThemes.subHeadingTitle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    centerTitle: true,
                    pinned: true,
                  ),
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: const Color(0xFF8AB8FC),
                    title: searchBar(),
                    expandedHeight: 80,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:doctorsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  DoctorDetaledPage(clickedDoctor:doctorsList[index],)));
                                },
                                child: Card(
                                  shadowColor: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 25),
                                        child: CircleAvatar(
                                          radius: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          loadedState.doctors[index].name,
                                          style: TextThemes.headingTitle.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        loadedState.doctors[index].specialty,
                                        style: TextThemes.subHeadingTitle.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        loadedState.doctors[index].hName,
                                        style: TextThemes.subHeadingTitle.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        childAspectRatio: 0.8),
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {});
        },
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          hintText: "Search Doctors",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
