part of 'add_image_provider.dart';

abstract class AddImageState {
  const AddImageState();
}

class AddImageInitial extends AddImageState {}

class AddImageLoading extends AddImageState {}

class AddImageSuccess extends AddImageState {}

class AddImageError extends AddImageState {
  final String message;
  const AddImageError(this.message);
}

class EditProfileLoading extends AddImageState {}

class EditProfileSuccess extends AddImageState {}

class EditProfileError extends AddImageState {
  final String message;
  const EditProfileError(this.message);
}
