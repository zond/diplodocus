import 'package:dcache/dcache.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import 'diplicity.dart';
import 'router.gr.dart';

// Location bar router.
final appRouter = AppRouter();
// Server to talk to.
final serverHost = Uri.parse("https://diplicity-engine.appspot.com");
// Variants
late ReloadNotifier variants =
    ReloadNotifier(value: APIResponse(null), url: Uri.parse(""));
// Root page of the server.
final ReloadNotifier serverRoot =
    ReloadNotifier(value: APIResponse(null), url: serverHost);
// Configuration (e.g. auth token).
late Box rootBox;
// Cache for game objects.
final gameCache = LruCache<String, ReloadNotifier>(storage: InMemoryStorage(64))
  ..loader = (String key, ReloadNotifier? old) {
    final result = ReloadNotifier(
        value: APIResponse(null), url: serverHost.replace(path: "Game/${key}"));
    result.reload();
    return result;
  };
