import 'package:afya_popote/main.dart';
import 'package:afya_popote/providers/dio_provider.dart';
import 'package:afya_popote/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentCard extends StatefulWidget {

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              // Add your first text widget
              Config.spaceSmall,
              Config.spaceSmall,
              Config.spaceSmall,
              Config.spaceSmall,
              Config.spaceSmall,
              Config.spaceSmall,
              Config.spaceSmall,
              Text(
                'Juu ya sehemu ya kuandika maoni yako utaona nyota tano ,twaomba utupatie alama ya ufanisi wetu kupitia izo nyota',
                style: TextStyle(
                  fontSize: 16  ,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add your second text widget
              Config.spaceSmall,
              Config.spaceSmall,
              Text(
                'Ukichagua nyota ya pili maana yake huduma zetu mbaya',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              Config.spaceSmall,
              Config.spaceSmall,
              // Add your third text widget
              Text(
                'Ukichagua nyota ya tatu maana yake huduma zetu zinaridhisha',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              Config.spaceSmall,
              Config.spaceSmall,
              Text(
                'Ukichagua nyota ya nne maana yake huduma zetu ni nzuri',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              Config.spaceSmall,
              Config.spaceSmall,
              Text(
                'Ukichagua nyota ya tano maana yake huduma zetu ni bora sana',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              Config.spaceSmall,
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return RatingDialog(
                                  initialRating: 1.0,
                                  title: const Text(
                                    '',
                                    textAlign: TextAlign.center,
                                  ),
                                  image: Image.asset(
                                    'assets/profile1.jpg',
                                    width: 150,
                                    height: 150,
                                  ),
                                  submitButtonText: 'Tuma maoni ',
                                  commentHint: 'Andika maoni hapa',
    onSubmitted: (response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (response.comment == null || response.comment.isEmpty) {
    // If no comment is provided
    showDialog(
    context: context,
    builder: (context) {
    return AlertDialog(
    title: Text('Haujaandika maoni',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),),
    content: Text('Tafadhari andika maoni kabla kutuma.',
      style: TextStyle(
        fontSize: 15,
        color: Colors.red,
      ),),
    actions: [
    TextButton(
    onPressed: () {
    Navigator.of(context).pop();
    },
    child: Text('Sawa'),
    ),
    ],
    );
    },
    );
    } else {
    // If a comment is provided
    final rating = await DioProvider().storeReviews(
    response.comment,
    response.rating as double,
    token,
    );

    if (rating == 200 && rating != '') {
    showDialog(
    context: context,
    builder: (context) {
    return AlertDialog(
    title: Text('Umetuma maoni kikamilifu'),
    actions: [
    TextButton(
    onPressed: () {
      Future.delayed(Duration.zero, () {
        MyApp.navigatorKey.currentState!.pushNamed('main');
      });

    },
    child: Text('Sawa'),
    ),
    ],
    );
    },
    );
    }



    }
                                  });
                            });
                      },
                      child: const Text(
                        'Bonyeza hapa kuandika maoni yako',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Schedule Widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.appointment}) : super(key: key);
  final Map<String, dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '${appointment['day']}, ${appointment['date']}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            appointment['time'],
            style: const TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
