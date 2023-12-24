import 'package:flutter/material.dart';
import '../Config/Color.dart';

class HospitalDetailCard extends StatelessWidget {

  final String hospitalName;
  final String hospitalImage;
  final double rating;
  final int seatsAvailable;
  final List<Comment> comments;

  const HospitalDetailCard({super.key,
    required this.hospitalName,
    required this.hospitalImage,
    required this.rating,
    required this.seatsAvailable,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 17),
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
                Container(
                  height: 200,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hospitalName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                        Icons.event_seat,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10,30 , 0, 10),
            child: Text(
              'Comments:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          comments[index].username,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 5),
                        Text(
                          comments[index].rating.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      comments[index].comment,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.green) ,
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String username;
  final double rating;
  final String comment;

  Comment({
    required this.username,
    required this.rating,
    required this.comment,
  });
}
