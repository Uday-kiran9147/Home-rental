import 'package:flutter/material.dart';

class FuturisticAppBar extends StatelessWidget  {
  const FuturisticAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Set background to transparent
      elevation: 0, // Remove shadow
      title: const Row(
        children: [
          Text(
            'Home Rental',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24, // Increase font size
              fontWeight: FontWeight.bold, // Add bold font weight
            ),
          ),
          SizedBox(width: 16), // Add spacing
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.blue, // Match icon color to title color
            size: 32, // Increase icon size
          ),
          onPressed: () {
            // Add functionality to add a new house here.
          },
        ),
        const SizedBox(width: 16), // Add spacing
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.blue, // Match icon color to title color
            size: 32, // Increase icon size
          ),
          onPressed: () {
            // Add functionality to show notifications here.
          },
        ),
      ],
    );
  }
}
