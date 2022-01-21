import 'package:flutter/material.dart';
import 'package:movie_app/components/horizontal_list.dart';
import 'package:movie_app/components/latest_content.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LatestContent(),
              const SizedBox(height: 20),
              HorizontalList(title: 'Popular TV Shows'),
              const SizedBox(height: 20),
              HorizontalList(title: 'Popular Movies'),
            ],
          ),
        ),
      ),
    );
  }
}
