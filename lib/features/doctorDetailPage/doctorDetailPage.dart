import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_appoinment_booking/features/paymentPage/ui/paymentPage.dart';
import 'package:doctor_appoinment_booking/utils/textThemes/textThemes.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../routes/routes.dart';
import 'bloc/doctor_detailed_bloc.dart';

class DoctorDetaledPage extends StatefulWidget {
  const DoctorDetaledPage({super.key, required this.clickedDoctor});
  final   clickedDoctor;

  @override
  State<DoctorDetaledPage> createState() => _DoctorDetaledPageState();
}

class _DoctorDetaledPageState extends State<DoctorDetaledPage> {

  DatePickerController datePickerController = DatePickerController();

  Razorpay? _razorpay;


  DoctorDetailedBloc detailedBloc = DoctorDetailedBloc();

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "Payment Success ${response.paymentId}",timeInSecForIosWeb: 5);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    PaymentPage()));
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Payment Failed ${response.message}",timeInSecForIosWeb: 5);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet is ${response.walletName}",timeInSecForIosWeb: 5);
  }

  void makePayment()async{
    var options = {
      "key": "rzp_test_ztCftNJFHUlPQJ",
      "amount":50000,
      "name":"Appointment Booking",
      "description":"Appointment Booking",
    "prefill":{'contact':'9526680771','email':'sreejithhkm@gmail.com'}
    };
    try{

      _razorpay?.open(options);
    }catch(e){
      debugPrint(e.toString());
    }
  }
  @override
  void initState() {
    detailedBloc.add(DetailedInitialEvent(clickedDoctor: widget.clickedDoctor));
    _razorpay = Razorpay();

    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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
        String date = datePickerController.toString();
        var selectedSlot = '';
       var  selectedDate = DateTime.now();
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
                            CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(widget.clickedDoctor['doctorImg']),
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
                            onDateChange: (value){
                            selectedDate = value;
                            },
                            controller: datePickerController,
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
                            height: 180,
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
                                      selectedSlot = loadedState.selectedSlotIndex;
                                      detailedBloc.add(BookingEvent(
                                          slot: loadedState.timings[index], selectedDate: selectedDate)
                                      );

                                    });

                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                        color: loadedState.selectedSlotIndex ==
                                                loadedState.timings[index]
                                            ? Colors.deepPurple
                                            : Colors.transparent),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Center(
                                        child: Text(
                                          loadedState.timings[index],
                                          style: TextStyle(
                                              color: loadedState
                                                          .selectedSlotIndex ==
                                                      loadedState.timings[index]
                                                  ? Colors.white
                                                  : Colors.deepPurple,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 140),
                            child: InkWell(
                              onTap: (){
                                makePayment();


                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.deepPurple,
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Center(
                                    child: Text(
                                  "Book Appointment",
                                  style: TextThemes.subHeadingTitle
                                      .copyWith(fontSize: 18),
                                )),
                              ),
                            ),
                          ),
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
