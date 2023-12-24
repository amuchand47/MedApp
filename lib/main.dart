import 'package:flutter/material.dart';
import 'package:medhelp/Widgets/HospitalRegistrationForm.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Config/Color.dart';
import 'Widgets/HospitalCard.dart';
import 'Widgets/HospitalLoginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color myHexColor = const Color(0xffF4C2C2);
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedHelp',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xffF4C2C2)),
      ),
      home: const MyHomePage(title: 'Med Help'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _loadHosp = false;

  @override
  void initState() {
    // TODO: implement initState
    calldelay();
    super.initState();
  }

void calldelay(){
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _loadHosp = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _loadHosp? Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            children:  [
              HospitalCard(hospitalName: "DR BR Ambedkar Hospital Raipur",  hospitalImage: "assets/images/hos1.jpg", rating: 5,seatsAvailable: 30, distance: 1, equipments: "ECG",),
              HospitalCard(hospitalName: "District Hospital Pandri",  hospitalImage: "assets/images/hos2.jpg", rating: 4.2,seatsAvailable: 17, distance: 1,equipments: "XRAY",),
              HospitalCard(hospitalName: "District Hospital Lalpur",  hospitalImage: "assets/images/hos3.jpg", rating: 4.9,seatsAvailable: 23, distance: 1.5, equipments: "XRAY",),
              HospitalCard(hospitalName: "District Hospital Kalibadi",  hospitalImage: "assets/images/hos.jpg", rating: 4.4,seatsAvailable: 15, distance: 2, equipments: "XRAY",),
              HospitalCard(hospitalName: "District Hospital Tatiband",  hospitalImage: "assets/images/hos.jpg", rating: 5,seatsAvailable: 25, distance: 3, equipments: "XRAY",),
            ],
          ),
        )
      ): Center(
        child: LoadingAnimationWidget.hexagonDots(
          color: const Color(0xffF4C2C2),
          size: 200,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const HospitalRegistrationForm());
        },
        tooltip: 'Increment',
        child: Shimmer.fromColors(
            baseColor: Colors.green,
            highlightColor: Colors.green,
            child: const Icon(
              Icons.local_hospital_outlined,
              color: Colors.white,
            )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
