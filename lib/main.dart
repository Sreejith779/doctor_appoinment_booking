import 'package:doctor_appoinment_booking/features/routes/routes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Routes(),
    );
  }
}
