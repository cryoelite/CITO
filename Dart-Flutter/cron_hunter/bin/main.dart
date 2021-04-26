import 'dart:developer';
import 'dart:ffi' as ffi;

import 'dart:io';
import 'package:cron_hunter/GeneratedCronetBindings.dart';

Future<void> main() async {
  final cronetDart = CronetDart(ffi.DynamicLibrary.open(
      Platform.script.resolve('cronet/cronet.dll').toFilePath()));
}

/* class PP extends Cronet_UrlRequestCallback {
  @override
  void onRedirectReceived(
      Cronet_UrlRequest cronet_urlRequest,
      Cronet_UrlResponseInfo cronet_urlResponseInfo,
      String newLocationURL) async {
    if (true) {
      cronet_urlRequest.followRedirect();
    }
  }
} */
