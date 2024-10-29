import 'package:file/local.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mocktail/mocktail.dart';

/// [CustomeCacheManager] is a custom implementation of [DefaultCacheManager] used for testing purposes.
/// Due to classic CachedNetworkImage error during testing phase , we need to used it. 
/// I think we could found a better way to do it, for example, our customers should put an image in their golden tests. 
class CustomCacheManager extends Mock implements DefaultCacheManager {
  static const fileSystem = LocalFileSystem();

  @override
  Stream<FileResponse> getImageFile(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
    int? maxHeight,
    int? maxWidth,
  }) async* {
    yield FileInfo(
      fileSystem.file(''),
      FileSource.Cache,
      DateTime(2050),
      url,
    );
  }
}
