import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/course_remote_data_source.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class CourseRemoteRepository implements ICourseRepository {
  final CourseRemoteDataSource remoteDataSource;

  CourseRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createCourse(CourseEntity course) async {
    try {
      remoteDataSource.createCourse(course);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) async {
    try {
      remoteDataSource.deleteCourse(id);
      return Future.value(Right(null));
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    try {
      return remoteDataSource.getCourses().then(
        (value) {
          return Right(value);
        },
      );
    } catch (e) {
      return Future.value(Left(ApiFailure(message: e.toString())));
    }
  }
}
