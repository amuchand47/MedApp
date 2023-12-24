import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  void showConfirmationDialog() {
    Get.defaultDialog(
      title: 'Confirmation',
      content: const Text('Are you really want to notify Hospital?'),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back(result: true); // Return true when the user confirms
        },
        child: const Text('Yes'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back(result: false); // Return false when the user cancels
        },
        child: const Text('No'),
      ),
    ).then((value) {
      if (value != null) {
        if (value) {
          Get.snackbar("Confirmed", "Hospital awaiting you",isDismissible: true , backgroundColor: Colors.green,snackPosition: SnackPosition.BOTTOM  );
        } else {
          // User clicked on 'No'
          // Perform any other action or handle cancellation
         // print('Cancelled');
        }
      }
    });
  }
}
