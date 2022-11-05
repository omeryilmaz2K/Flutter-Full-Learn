import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import '../package_learn_view.dart';

mixin LaunchMixin on State<PackageLearnView> {
  void name(params);

  Future<void> launchURL(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }
}
