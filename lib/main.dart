import 'package:flutter/material.dart';
import 'interface/i_shared_details.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isSmartPhone = false;
    return appBarForPlatforms(context, isSmartPhone, key);
  }
}
