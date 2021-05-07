import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:wemapgl/wemapgl.dart' as WEMAP;
import 'map/full_map.dart';
import 'map/ePage.dart';

final List<ePage> _allPages = <ePage>[
  FullMapPage(),
];

class MyApp extends StatelessWidget {
  void _pushPage(BuildContext context, ePage page) async {
    final location = Location();
    final hasPermissions = await location.hasPermission();
    if (hasPermissions != PermissionStatus.GRANTED) {
      await location.requestPermission();
    }

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('WeMap examples')),
        body: FullMapPage());
  }
}

void main() {
  WEMAP.Configuration.setWeMapKey('GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ');
  runApp(MaterialApp(home: MyApp()));
}
