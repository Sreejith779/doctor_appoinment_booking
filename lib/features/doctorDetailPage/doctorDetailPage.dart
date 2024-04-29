import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor_appoinment_booking/models/hospitalList.dart';
import 'package:doctor_appoinment_booking/utils/textThemes/textThemes.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DoctorDetaledPage extends StatefulWidget {
  const DoctorDetaledPage({super.key, required this.clickedDoctor});
  final Map clickedDoctor;

  @override
  State<DoctorDetaledPage> createState() => _DoctorDetaledPageState();
}

class _DoctorDetaledPageState extends State<DoctorDetaledPage> {
  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.clickedDoctor["name"],
                        style: TextThemes.subHeadingTitle),
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
                  margin: EdgeInsets.only(top: 5),
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
                Container(
                  height: double.maxFinite,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                      childAspectRatio: 2),
                      itemCount: widget.clickedDoctor['bookingTimings'].length,
                      itemBuilder: (context,index){
                     return Container(
                       margin: EdgeInsets.all(5),
                       color: Colors.grey,
                       child: Text(widget.clickedDoctor["bookingTimings"]["time"].toString()),
                     );
                      }),
                )

              ],
            )
          ]))
        ],
      ),
    );
  }
}
