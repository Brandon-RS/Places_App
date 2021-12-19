import 'package:flutter/material.dart';
import 'package:places_app/src/data/data.dart';
import 'package:places_app/src/screens/details_screen.dart';

class TravelPlaceSlide extends StatefulWidget {
  const TravelPlaceSlide({Key? key}) : super(key: key);

  @override
  State<TravelPlaceSlide> createState() => _TravelPlaceSlideState();
}

class _TravelPlaceSlideState extends State<TravelPlaceSlide> {
  List<String> values = ['All', 'Latest', 'Popular'];
  int aux = 0;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Row(
            children: [
              _option(index: 0),
              _option(index: 1),
              _option(index: 2),
            ],
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: size.width - 80,
          height: 300,
          child: ListOfPlaces(categ: aux, controller: controller),
        ),
      ],
    );
  }

  Widget _option({required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          aux = index;
          controller.jumpTo(0.0);
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFb16d51),
            ),
            width: aux == index ? 40.0 : 0.0,
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              values[index],
              style: TextStyle(
                color: aux == index ? const Color(0xFFb16d51) : Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListOfPlaces extends StatelessWidget {
  ListOfPlaces({Key? key, required this.categ, required this.controller}) : super(key: key);
  final int categ;
  final Data data = Data();

  final ScrollController controller;

  category() {
    if (categ == 0) {
      return data.allName.length;
    } else if (categ == 1) {
      return data.latestName.length;
    }
    return data.popularName.length;
  }

  placeName() {
    if (categ == 0) {
      return data.allName;
    } else if (categ == 1) {
      return data.latestName;
    }
    return data.popularName;
  }

  categoryImage() {
    if (categ == 0) {
      return data.allImg;
    } else if (categ == 1) {
      return data.latestImg;
    }
    return data.popularImg;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: category(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsScreen(image: categoryImage()[index], name: placeName()[index])),
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          image: NetworkImage(categoryImage()[index]),
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          placeName()[index],
                          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _bottomCard(index: index),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 100,
                  right: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Text('\$750', style: TextStyle(fontSize: 16)),
                  ),
                ),
                Positioned(
                  right: 50,
                  top: 2,
                  child: FavoriteWidget(index: index),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container _bottomCard({required int index}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black26),
              children: [
                const WidgetSpan(child: Icon(Icons.location_on, color: Colors.black12, size: 18)),
                const WidgetSpan(child: SizedBox(width: 5)),
                WidgetSpan(
                  child: SizedBox(
                    width: 80,
                    height: 20,
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(data.locations[index], style: const TextStyle(color: Colors.black38)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 70,
            height: 33,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black12),
            child: const FittedBox(
              child: Text(
                '5 days',
                style: TextStyle(fontSize: 18, color: Colors.black38),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  late Color color;

  @override
  void initState() {
    color = Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.bookmark, color: color, size: 30),
      onTap: () {
        setState(() {
          color = color == Colors.white ? Colors.amber : Colors.white;
        });
      },
    );
  }
}
