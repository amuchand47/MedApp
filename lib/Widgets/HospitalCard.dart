import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Config/Dialog.dart';
import 'HospitalDetailCard.dart';

class HospitalCard extends StatelessWidget {

  final DialogController controller = Get.put(DialogController());

  final String hospitalName;
  final String hospitalImage;
  final double rating;
  final double distance;
  final String equipments;
  final int seatsAvailable;

  HospitalCard({super.key,
    required this.hospitalName,
    required this.hospitalImage,
    required this.rating,
    required this.distance,
    required this.equipments,
    required this.seatsAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Get.to(HospitalDetailCard(hospitalName: hospitalName, hospitalImage: hospitalImage, rating: rating, seatsAvailable: seatsAvailable, comments: [Comment(username: "Adharika", rating: 5, comment: "Wonderful experience with the Clinic. Dr was a wonderful surgeon, and the staff was always helpful and kind. "), Comment(username: "Sam", rating: 5, comment: "Best Hospital in Raipur"), Comment(username: "Junaid", rating: 5, comment: "Fastest Services, Best Doctors")],));
            },
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(hospitalImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hospitalName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.bed_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            seatsAvailable.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 5),
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "$distance Km",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.medical_services_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            equipments,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                InkWell(
                  onTap: (){
                    controller.showConfirmationDialog();
                  },
                  child: const Icon(
                    size: 60,
                    Icons.notifications_active,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
