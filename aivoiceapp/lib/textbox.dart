import 'package:flutter/material.dart';


class TextBox extends StatelessWidget {
  final String text;
  const TextBox({
    super.key,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 51,
              width: 233,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors:[Color(0xFFFCA129), Color(0xFFC35C2E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 18
                  ),
                ),
              ),
            );
  }
}