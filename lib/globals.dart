import 'router.gr.dart';
import 'diplicity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final appRouter = AppRouter();
final serverHost = Uri.parse("https://diplicity-engine.appspot.com");
ResponseJSON serverRoot = ResponseJSON(null);
late Box rootBox;