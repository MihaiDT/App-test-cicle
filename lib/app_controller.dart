import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/data/models/survey.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';

/// Just a wrapper in order to simplify getter access
class EasyGetter<T> {
  Rx<ResponseHandler<T>> rxValue;

  EasyGetter() : rxValue = ResponseHandler<T>.initial().obs;

  T? get value => rxValue.value.content;

  ResponseHandler<T> get responseHandler => rxValue.value;

  set responseHandler(ResponseHandler<T> newResponseHandler) {
    rxValue.value = newResponseHandler;
  }
}

/// The app state
class AppController extends GetxController {
  /// The response of log in and register api
  final EasyGetter<User> user;

  final EasyGetter<Question> question;
  final EasyGetter<Survey> survey;

  /// The parameter used to register the user
  final RegistrationParameters registerParameter;

  /// Determine if the user is trying to log in or sign up
  final RxBool isLoginFlow;

  AppController._({
    required this.question,
    required this.user,
    required this.survey,
    required this.registerParameter,
    required this.isLoginFlow,
  });

  factory AppController.initial() {
    return AppController._(
      user: EasyGetter<User>(),
      question: EasyGetter<Question>(),
      survey: EasyGetter<Survey>(),
      registerParameter: RegistrationParameters.initial(),
      isLoginFlow: false.obs,
    );
  }
}
