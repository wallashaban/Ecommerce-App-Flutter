import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final String about;
  final String terms;

  const Settings({required this.about,required this.terms});
  
  @override
  List<Object?> get props => [
    about,
    terms,
  ];
}
