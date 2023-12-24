import 'package:flutter/material.dart';
import '../Config/Color.dart';

class HospitalProfilePage extends StatelessWidget {

  final String hospitalName;
  final String licenseNumber;
  final List<String> resources;
  final List<String> patients;
  final List<String> avail;
  final String location;

  const HospitalProfilePage({
    super.key,
    required this.hospitalName,
    required this.licenseNumber,
    required this.resources,
    required this.patients,
    required this.avail,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: createMaterialColor(const Color(0xffF4C2C2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    hospitalName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'License Number: $licenseNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined, color: Colors.green,),
                    title: Text(location),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: createMaterialColor(const Color(0xffF4C2C2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.medical_services_rounded, size: 32, color: Colors.red,),
                  ),
                  const Divider(height: 2, color: Colors.green),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: resources.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.add_box_outlined),
                        title: Text(resources[index]),
                        subtitle: Text(avail[index]),
                        trailing: const Icon(Icons.remove_circle_outline),
                      );
                    }, separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.green),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: createMaterialColor(const Color(0xffF4C2C2)),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Patient Coming:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(height: 2, color: Colors.green),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){},
                        trailing: const Icon(Icons.location_on, color: Colors.red,),
                        leading: Text("${index+1}. "),
                        title: Text(patients[index]),
                      );
                    }, separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.green),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
