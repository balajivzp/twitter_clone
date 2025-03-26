import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 35,
      elevation: 0,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        }, // Action when profile icon is tapped
        child: CircleAvatar(
          child: Image.asset(
            'assets/profile.png',
          ),
          //  backgroundImage: AssetImage('assets/profile.png'),
        ),
      ),
      title: Center(
        child: Image.asset(
          'assets/x.png', // Path to your brand logo image
          height: 40, // Adjust size as needed
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {}, // Action when notification icon is tapped
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
