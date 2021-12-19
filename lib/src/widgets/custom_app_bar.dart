import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 43),
        ),
        Text(
          'Hello $name',
          style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        const Expanded(child: SizedBox()),
        GestureDetector(
          child: const MenuOption(),
          onTap: () {},
        ),
      ],
    );
  }
}

class MenuOption extends StatelessWidget {
  const MenuOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(children: [_dot(), _dot()]),
          Row(children: [_dot(), _dot()]),
        ],
      ),
    );
  }

  Container _dot() {
    return Container(
      margin: const EdgeInsets.all(4),
      color: Colors.black,
      width: 6.0,
      height: 6.0,
    );
  }
}
