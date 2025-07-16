import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/services/storage_service.dart';

class ImagesRepoImpl extends ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadFile(
      {required file, required String path}) async {
    try {
      String url = await storageService.uploadFile(file, path);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to upload image'));
    }
  }
}
