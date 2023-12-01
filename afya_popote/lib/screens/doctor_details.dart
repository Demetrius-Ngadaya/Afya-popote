import 'package:afya_popote/components/button.dart';
import 'package:afya_popote/models/auth_model.dart';
import 'package:afya_popote/providers/dio_provider.dart';
import 'package:afya_popote/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components//custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key, required this.doctor, required this.isFav})
      : super(key: key);
  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  Map<String, dynamic> doctor = {};
  bool isFav = false;

  @override
  void initState() {
    doctor = widget.doctor;
    isFav = widget.isFav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Sehemu ya malipo',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          //Favarite Button
          IconButton(
            //press this button to add/remove favorite doctor
            onPressed: () async {
              //get latest favorite list from auth model
              final list =
                  Provider.of<AuthModel>(context, listen: false).getFav;

              //if doc id is already exist, mean remove the doc id
              if (list.contains(doctor['doc_id'])) {
                list.removeWhere((id) => id == doctor['doc_id']);
              } else {
                //else, add new doctor to favorite list
                list.add(doctor['doc_id']);
              }

              //update the list into auth model and notify all widgets
              Provider.of<AuthModel>(context, listen: false).setFavList(list);

              final SharedPreferences prefs =
              await SharedPreferences.getInstance();
              final token = prefs.getString('token') ?? '';

              if (token.isNotEmpty && token != '') {
                //update the favorite list into database
                final response = await DioProvider().storeFavDoc(token, list);
                //if insert successfully, then change the favorite status

                if (response == 200) {
                  setState(() {
                    isFav = !isFav;
                  });
                }
              }
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              //Demetrius
              // color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: 'Mbele',
                onPressed: () {
                  Navigator.of(context).pushNamed('booking_page',
                      arguments: {"doctor_id": doctor['doc_id']});
                },
                disable: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key, required this.patients, required this.exp})
      : super(key: key);

  final int? patients; // Make patients nullable
  final int? exp;     // Make exp nullable

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients',
          value: patients?.toString() ?? 'N/A', // Provide a default value or 'N/A' if patients is null
        ),
        const SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experiences',
          value: exp != null ? '$exp years' : 'N/A', // Provide a default value or 'N/A' if exp is null
        ),
        const SizedBox(
          width: 15,
        ),
        const InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}


class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
