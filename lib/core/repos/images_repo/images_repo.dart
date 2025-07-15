import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage(
      {required dynamic imageFile, required String path});
}
