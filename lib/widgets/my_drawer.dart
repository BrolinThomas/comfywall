import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Icon(
                Icons.camera,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Dark Mode'),
              trailing: CupertinoSwitch(
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      )),
    );
  }
}
