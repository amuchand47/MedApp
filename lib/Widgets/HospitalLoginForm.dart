import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HospitalProfilePage.dart';

class HospitalLoginForm extends StatefulWidget {
  const HospitalLoginForm({super.key});

  @override
  _HospitalLoginFormState createState() => _HospitalLoginFormState();
}

class _HospitalLoginFormState extends State<HospitalLoginForm> {

  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _licenseController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _licenseController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login or authentication here
      String licenseNumber = _licenseController.text;
      String password = _passwordController.text;

      // Do something with the captured data (e.g., send to server for authentication)
      print('License Number: $licenseNumber');
      print('Password: $password');

      // Clear the form fields
      _licenseController.clear();
      _passwordController.clear();

      // Show a success message or navigate to the next screen
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Login successful.'),
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
        title: const Text('Hospital Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: (){
                  _submitForm();
                  //Get.to(const HospitalProfilePage(hospitalName: "DR BR Ambedkar Hospital Raipur", licenseNumber: "BNAAP012",location: "Raipur",resources: ["ECG", "2D ECHO", "X-RAY"], avail: ["Yes", "Yes", "No"], patients: ["Sam", "Elly"],));
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

