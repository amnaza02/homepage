import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  final String imagePath;

  const detailPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter, 
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), 
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, 
                  ),
              ),
            ),
          ),
        ],
      ),
       );
  }
}
