import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            minScale: 0.3,
            maxScale: 10.0,
            child: RotatedBox(
              quarterTurns: orientation == Orientation.portrait ? 1 : 0,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 0 : size.width - (padding.top + 15),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: RotatedBox(
                quarterTurns: orientation == Orientation.portrait ? 1 : 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(
                    left: padding.top + 5,
                    top: orientation == Orientation.portrait ? 5 : padding.top + 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10,
                  ),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
