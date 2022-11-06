import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

import 'custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  toShare(Uri path) async {
    await launchUrl(path);
  }
}

class FileDownload extends IFileDownload with shareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('successful');
    return true;
  }

  void smsShare() {}
  
  @override
  void share() {
    // TODO: implement share
  }
}

class SmsDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('successful');
    return true;
  }

  @override
  toShare(Uri path) async {
    await launchUrl(path);
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin shareMixin on IFileDownload {
  void share();
}