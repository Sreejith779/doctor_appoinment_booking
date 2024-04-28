import 'package:doctor_appoinment_booking/features/DetailPage/ui/detailPage.dart';
import 'package:doctor_appoinment_booking/features/homePage/bloc/home_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Hospital extends StatefulWidget {
  const Hospital({super.key, required this.hospitals});
 final  List hospitals;

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  get homeBloc => HomeBloc();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.5),
        itemCount:widget.hospitals.length,
        itemBuilder: (context,index){

          return InkWell(
            onTap: (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>
 DetailedPage(clickedHospital: widget.hospitals[index])));
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                 color: Colors.white
            ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image:
                      NetworkImage(widget.hospitals[index].hospitalImg.toString()),
                      fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(widget.hospitals[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),),
                        ),

                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.location_on_outlined,color: Colors.brown,),
                              Expanded(
                                child: Text(widget.hospitals[index].place,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500
                                ),),
                              )
                            ],
                          ),
                        ),
                     RatingBarIndicator(
                       rating: widget.hospitals[index].rating,
                         itemCount: 5,
                         itemSize: 25,
                         itemBuilder: (context,index){
                           return const Icon(Icons.star,
                             color: Colors.amber,
                           );
                         })
                      ],
                    ),
                  )
                ],
              )
            ),
          );
        });
  }
}
