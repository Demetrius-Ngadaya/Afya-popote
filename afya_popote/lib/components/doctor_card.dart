import 'package:afya_popote/main.dart';
import 'package:afya_popote/screens/doctor_details.dart';
import 'package:afya_popote/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.isFav,
  }) : super(key: key);

  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Row(
              children: [
                // SizedBox(
                //   width: Config.widthSize * 0.33,
                //   child: Image.asset(
                //     'assets/doctor_2.jpg',
                //     fit:BoxFit.fill,
                //   ),
                // ),
                Flexible(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          " ${doctor['category']}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          " ${doctor['bio_data']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "Gharama ya kukutana nae: ${doctor['experience']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        Card(
                          elevation: 0,
                          color: Colors.lightGreenAccent,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Config.spaceSmall,
                                      Text(
                                        "Chagua ${doctor['category']}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      // Add more content here if needed
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          //pass the details to detail page
          MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
              builder: (_) => DoctorDetails(
                doctor: doctor,
                isFav: isFav,
              )));
        },
      ),
    );
  }
}
