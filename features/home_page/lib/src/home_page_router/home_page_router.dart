import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../ui/detailed_character_screen.dart';
import '../ui/home_screen.dart';

part 'home_page_router.gr.dart';

@AutoRouterConfig()
class HomePageRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[];
}
