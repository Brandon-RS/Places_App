import 'package:flutter/material.dart';
import 'package:places_app/src/data/travel_groups_data.dart';
import 'package:places_app/src/screens/image_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.image, required this.name}) : super(key: key);

  static const String routeName = 'details';
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
          child: Column(
            children: [
              const TopWidget(),
              const SizedBox(height: 30),
              GestureDetector(
                child: ImageWidget(image: image, size: size, name: name),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ImageDetails(image: image)),
                ),
              ),
              const SizedBox(height: 30),
              const OptionSection(),
              const SizedBox(height: 30),
              const CommentWidget(),
              const SizedBox(height: 30),
              SelectableText(
                paragraph,
                style: const TextStyle(letterSpacing: 1.0, color: Colors.black45),
              ),
              const SizedBox(height: 30),
              MembersSection(size: size),
              const SizedBox(height: 30),
              const BottomSection(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amber[400],
          ),
          child: const Text(
            '\$270',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.04),
      ),
      child: Stack(
        children: [
          Positioned(
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.amber[700],
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          const Positioned(
            left: 28,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Icon(Icons.person, color: Colors.black54),
              ),
            ),
          ),
          Positioned(
            left: 56,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange[200],
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          const Positioned(
            left: 110,
            top: 12,
            child: Text('20+ Trip Members', style: TextStyle(fontSize: 18)),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 20),
              child: const Icon(Icons.watch_later_outlined, color: Colors.white70),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.amber),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Trip Duration', style: TextStyle(color: Colors.black26)),
                Text('6 Days', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Ratings', style: TextStyle(color: Colors.black26)),
                  Text('4.6', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptionSection extends StatelessWidget {
  const OptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Details', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xffda6247)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 28, vertical: 14)),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {},
          child: const Text('Reviews', style: TextStyle(color: Colors.black)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 28, vertical: 14)),
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.image, required this.size, required this.name}) : super(key: key);

  final String image;
  final Size size;
  final String name;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            image: NetworkImage(image),
            height: orientation == Orientation.portrait ? size.height * 0.4 : size.width * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: size.width - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black26),
                      children: [
                        WidgetSpan(child: Icon(Icons.location_on, color: Colors.black12, size: 18)),
                        WidgetSpan(child: SizedBox(width: 5)),
                        WidgetSpan(
                          child: SizedBox(
                            height: 20,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: Text('Locat', style: TextStyle(color: Colors.black38)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(2, 2)),
              ],
            ),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        const Text(
          'Group Travel',
          style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 43),
        ),
      ],
    );
  }
}
