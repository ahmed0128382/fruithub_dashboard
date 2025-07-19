import 'package:fruithub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String date;
  final num rating;
  final String image;
  final String review;

  ReviewModel(
      {required this.name,
      required this.date,
      required this.rating,
      required this.image,
      required this.review});
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
        name: reviewEntity.name,
        date: reviewEntity.date,
        rating: reviewEntity.rating,
        image: reviewEntity.image,
        review: reviewEntity.review);
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      date: json['date'],
      rating: json['rating'],
      image: json['image'],
      review: json['review'],
    );
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'review': review,
      'rating': rating,
    };
  }
}
