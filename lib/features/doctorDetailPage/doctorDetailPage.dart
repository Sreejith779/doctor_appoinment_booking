import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'package:doctor_appoinment_booking/utils/textThemes/textThemes.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import 'bloc/doctor_detailed_bloc.dart';

class DoctorDetaledPage extends StatefulWidget {
  const DoctorDetaledPage({super.key, required this.clickedDoctor});
  final Map clickedDoctor;

  @override
  State<DoctorDetaledPage> createState() => _DoctorDetaledPageState();
}

class _DoctorDetaledPageState extends State<DoctorDetaledPage> {
  DoctorDetailedBloc detailedBloc = DoctorDetailedBloc();
  @override
  void initState() {
    detailedBloc.add(DetailedInitialEvent(clickedDoctor: widget.clickedDoctor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DoctorDetailedBloc, DoctorDetailedState>(
      bloc: detailedBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case DoctorDetailedLoadedState:
            final loadedState = state as DoctorDetailedLoadedState;
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    backgroundColor: Colors.deepPurple,
                    expandedHeight: 160,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(loadedState.clickedDoctor['name'],
                                  style: TextThemes.subHeadingTitle),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat.yMMMd().format(DateTime.now()),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: DatePicker(
                            DateTime.now(),
                            height: 100,
                            width: 80,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Colors.deepPurple,
                            selectedTextColor: Colors.white,
                            dateTextStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Select Schedule Time",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: double.maxFinite,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2,
                              ),
                              itemCount: loadedState.timings.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                        color:Colors.transparent
                                            ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Center(
                                        child: Text(
                                          loadedState.timings[index],
                                          style: const TextStyle(
                                              color:  Colors.deepPurple,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )

                            )
                      ],
                    )
                  ]))
                ],
              ),
            );

          default:
            return const Text("error");
        }
      },
    );
  }
}
