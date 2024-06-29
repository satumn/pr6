import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformTypeApp extends StatefulWidget {

  const PlatformTypeApp({super.key});

  @override
  State<PlatformTypeApp> createState() => _MyPlatformTypeApp();
}

class _MyPlatformTypeApp extends State<PlatformTypeApp> {
  @override
  Widget build(BuildContext context) {
    if(kIsWeb) return WebApp();
    if(Platform.isAndroid) return AndroidApp();
    if(Platform.isWindows) return WinApp();
    return const Text('Undefined!', style: null);
  }
}

class WebApp extends StatefulWidget {

  const WebApp({super.key});

  @override
  State<WebApp> createState() => _MyWebAppState();
}

class _MyWebAppState extends State<WebApp>{
  @override
  Widget build(BuildContext context) {
    return const Text('Web!');
  }
}

class AndroidApp extends StatefulWidget {

  const AndroidApp({super.key});

  @override
  State<AndroidApp> createState() => _MyAndroidAppState();
}

class _MyAndroidAppState extends State<AndroidApp> {
  @override
  Widget build(BuildContext context) {
    return const Text('Android!');
  }
}

class WinApp extends StatefulWidget {

  const WinApp({super.key});

  @override
  State<WinApp> createState() => _MyWinAppState();
}

class _MyWinAppState extends State<WinApp> {
  @override
  Widget build(BuildContext context) {
    return const Text('Windows!');
  }
}
