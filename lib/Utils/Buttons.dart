import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final Widget screen;
  const Buttons(
      {super.key,
      required this.iconImagePath,
      required this.buttonText,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // icon button (Transfer)
        Container(
          padding: EdgeInsets.all(12),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius: 5)
              ]),
          child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (s) => screen));
                  },
                  icon: Image.asset(iconImagePath, width: 150, height: 100))),
        ),
        SizedBox(height: 8),
        Text(buttonText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
