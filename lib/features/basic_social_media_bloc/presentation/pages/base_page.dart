import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget pageContent;
  const BasePage({super.key, required this.pageContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pageContent,
      ),
    );
  }
}
