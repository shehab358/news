import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(String? errMessage, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Something Went Wrong!!!'),
    );
  }
}
