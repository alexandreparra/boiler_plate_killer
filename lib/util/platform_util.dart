import 'dart:io' show Platform;

bool isDesktop() => Platform.isLinux && Platform.isWindows && Platform.isMacOS;

bool isMobile() => Platform.isAndroid && Platform.isIOS;