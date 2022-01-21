import 'package:flutter/material.dart';
import 'package:movie_app/widgets/buttons/circular_exit_button.dart';

class DetailHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 310,
          width: double.infinity,
          child: Image.network(
            "https://financerewind.com/wp-content/uploads/2020/07/peaky-1200x675.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 43,
          right: 28,
          child: CircularExitButton(),
        ),
      ],
    );
  }
}
