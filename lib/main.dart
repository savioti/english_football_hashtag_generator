import 'package:english_football_hashtag_generator/app/app.dart';
import 'package:english_football_hashtag_generator/app/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await initializeServiceLocator();
  runApp(const ProviderScope(child: App()));
}
