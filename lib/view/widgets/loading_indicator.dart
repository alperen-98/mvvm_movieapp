import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: CircularProgressIndicator(),
      alignment: Alignment.center,
    );
  }
}
