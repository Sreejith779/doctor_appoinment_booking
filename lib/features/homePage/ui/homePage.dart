
import 'package:doctor_appoinment_booking/features/DetailPage/ui/detailPage.dart';
import 'package:doctor_appoinment_booking/features/homePage/ui/hospital.dart';
import 'package:doctor_appoinment_booking/models/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/textThemes/textThemes.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final pageController = PageController();
  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous,current)=>(current is HomeActionState),
      buildWhen: (previous,current)=>(current is !HomeActionState),
      listener: (context, state) {

      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            return Scaffold(
                backgroundColor: Colors.blue.withOpacity(0.2),
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: false,
                      floating: false,
                      backgroundColor:Color(0xFF8AB8FC),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, Sreejith",
                            style: TextThemes.subHeadingTitle,
                          ),
                          Text(
                            "Welcomeback!",
                            style: TextThemes.headingTitle,
                          ),
                        ],
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SliverAppBar(
                      pinned: true,
                      backgroundColor:Color(0xFF8AB8FC),
                      title: searchBar(),
                      expandedHeight: 80,

                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          banner(),
                          Center(
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: const WormEffect(
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  type: WormType.underground),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                              child: Hospital(hospitals:loadedState.hospitals)
                          )
                        ],
                      )
                    ]))
                  ],
                )

                // Container(
                //   margin: EdgeInsets.all(20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       searchBar(),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       banner(),
                //       Center(
                //         child: SmoothPageIndicator(
                //           controller: pageController,
                //           count: 3,
                //           effect: const WormEffect(
                //               dotHeight: 10,
                //               dotWidth: 10,
                //               type: WormType.underground),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           "Find your Hospital",
                //           style: TextThemes.subHeadingTitle,
                //         ),
                //
                //
                //       ),
                //       Hospitals()
                //     ],
                //   ),
                // ),
                );

          default:
            return Text("Error");
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
      child: const TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search_outlined,
              color: Colors.black ,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  banner() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.maxFinite,
      child: PageView(
        controller: pageController,
        children: List.generate(
          banners.length,
          (index) => Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
             image: DecorationImage(image: AssetImage("assets/${banners[index]}"),
             fit: BoxFit.cover)
            ),
          ),
        ),
      ),
    );
  }
}
