import 'package:flutter/material.dart';
import 'package:places_app/src/data/travel_groups_data.dart';

class TravelGroups extends StatelessWidget {
  const TravelGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TravelGroupData trGroups = TravelGroupData();

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(trGroups.banners[index], height: 100, width: 80, fit: BoxFit.cover),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trGroups.nameGroups[index],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      'Group Members',
                      style: TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                    const SizedBox(height: 10),
                    const GroupsWidget(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
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
            left: 25,
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
            left: 50,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange[200],
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 75,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.orange[900],
                child: const Text('20+', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
