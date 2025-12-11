import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(this.label, {super.key, required this.onTap});

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), 
        ),
        elevation: 7, 
      ),
      child: Text(label, style: TextStyle(fontSize: 30)),
    );
  }
}