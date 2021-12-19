import 'package:flutter/material.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 55,
            alignment: Alignment.centerLeft,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Search places!',
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFFf5c158), Color(0xFFd99923)],
            ),
          ),
          margin: const EdgeInsets.only(right: 30),
          width: 55,
          height: 55,
        ),
      ],
    );
  }
}
