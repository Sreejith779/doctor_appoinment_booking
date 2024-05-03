
import 'package:doctor_appoinment_booking/features/doctorDetailPage/doctorDetailPage.dart';
import 'package:doctor_appoinment_booking/models/hospitalList.dart';

import 'package:flutter/material.dart';


class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key, required this.clickedHospital});
  final HospitalModel clickedHospital;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.clickedHospital.hospitalImg,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepPurple.shade400,
                ),
                child: Center(
                  child: Text(
                    widget.clickedHospital.name,
                    style: const TextStyle(
                      fontSize: 12,
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Available Doctors",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
            )
          ])),
          SliverPadding( 
            padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
            sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemCount: widget.clickedHospital.doctors.length,
            itemBuilder: (context, index) {
              return   InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  DoctorDetaledPage(clickedDoctor: widget.clickedHospital.doctors[index],)));
                },
                child: Card(
                  elevation: 0.5,
                  color: Color(0xFFE7E5FF),
                  child: Column(
                    children: [
                        Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(widget.clickedHospital.doctors[index]['doctorImg']),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(widget.clickedHospital.doctors[index]['name'],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,

                        ),),
                      ),
                      Text(widget.clickedHospital.doctors[index]['specialty'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,

                      ),),
                    ],
                  ),

                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
