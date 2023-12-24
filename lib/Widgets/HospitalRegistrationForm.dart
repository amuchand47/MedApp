import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HospitalLoginForm.dart';
import 'HospitalProfilePage.dart';

class HospitalRegistrationForm extends StatefulWidget {
  const HospitalRegistrationForm({super.key});
  @override
  _HospitalRegistrationFormState createState() =>
      _HospitalRegistrationFormState();
}

class _HospitalRegistrationFormState extends State<HospitalRegistrationForm> {

  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _licenseController = TextEditingController();
  late final TextEditingController _locationController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _licenseController.dispose();
    _locationController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform registration or data submission here
      String hospitalName = _nameController.text;
      String licenseNumber = _licenseController.text;
      String location = _locationController.text;
      String password = _locationController.text;

      // Do something with the captured data (e.g., send to server)
      print('Hospital Name: $hospitalName');
      print('License Number: $licenseNumber');
      print('Location: $location');

      // Clear the form fields
      _nameController.clear();
      _licenseController.clear();
      _locationController.clear();
      _passwordController.clear();

      // Show a success message or navigate to the next screen
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Hospital registration successful.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(const HospitalProfilePage(hospitalName: "DR BR Ambedkar Hospital Raipur", licenseNumber: "BNAAP012",location: "Raipur",resources: ["ECG", "2D ECHO", "X-RAY"], avail: ["Yes", "Yes", "No"], patients: ["Adharika", "Sam", "Junaid"],));
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the hospital name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Hospital Name',
                  ),
                ),
                TextFormField(
                  controller: _licenseController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the license number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'License Number',
                  ),
                ),
                TextFormField(
                  controller: _locationController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the location';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Location',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          _submitForm();
                        },
                        child: const Text('Register'),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: (){
                          Get.to(const HospitalLoginForm());
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

