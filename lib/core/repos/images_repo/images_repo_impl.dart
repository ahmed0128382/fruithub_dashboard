import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl extends ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(
      {required imageFile, required String path}) {
    throw UnimplementedError();
  }
}
