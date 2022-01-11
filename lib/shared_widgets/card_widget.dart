import 'package:amazing_todo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.data}) : super(key: key);

  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          leading: const Icon(
            Icons.check_circle_outline,
            color: Colors.blue,
          ),
          title: Text(data.title, style: GoogleFonts.firaSans()),
          subtitle: Text(
            data.description,
            style: GoogleFonts.montserratAlternates(),
          ),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.access_alarm_outlined,
                color: Colors.blue,
              ),
              Text('Yesterday')
            ],
          ),
        ),
      ),
    );
  }
}
