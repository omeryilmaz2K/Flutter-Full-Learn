class FileDownloadException implements Exception { // Exception cannat be extends
  @override
  String toString() {
    return 'File download has failed.';
  }
}