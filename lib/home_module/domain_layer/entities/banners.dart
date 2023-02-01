import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final int id;
  final String image;
  const Banners({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [id, image];
}
