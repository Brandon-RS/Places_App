import 'package:flutter/material.dart';
import 'package:places_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    String name = 'Bruce';

    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              CustomAppBar(name: name),
              const SizedBox(height: 20),
              const Text(
                'Explore the\nBeautiful world!',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 30),
              ),
              const SizedBox(height: 20),
              const SearchPlace(),
              const SizedBox(height: 20),
              GestureDetector(
                child: const TravelPlacesTitle(title: 'Travel Places'),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              const TravelPlaceSlide(),
              const SizedBox(height: 20),
              GestureDetector(
                child: const TravelPlacesTitle(title: 'Travel Groups'),
                onTap: () {},
              ),
              const SizedBox(
                height: 120,
                child: TravelGroups(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color(0xFFf7f7f7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.home, color: Colors.black26, size: 30),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
            const Icon(Icons.contact_support, color: Colors.black26, size: 30),
          ],
        ),
      ),
    );
  }
}

class TravelPlacesTitle extends StatelessWidget {
  const TravelPlacesTitle({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        const Expanded(child: SizedBox()),
        RichText(
          text: const TextSpan(
            text: 'Show more',
            style: TextStyle(color: Colors.black26),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black26,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
