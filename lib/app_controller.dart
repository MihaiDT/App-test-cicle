import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/calendar_day_view_model.dart';
import 'package:lines/data/models/check_email.dart';
import 'package:lines/data/models/db_calendar_day_dto_map.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/data/models/settings.dart';
import 'package:lines/data/models/survey.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/social_login_parameter.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';

import 'data/models/advices_grouped_by_category.dart';
import 'data/models/calendar_day_dto_map.dart';
import 'data/models/period_map.dart';

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
  final EasyGetter<Settings> settings;
  final EasyGetter<Survey> survey;
  final EasyGetter<CheckEmail> checkEmail;

  /// The parameter used to register the user
  final RegistrationParameters registerParameter;

  final UpdateUserParameters updateUserParameters;

  final SocialLoginParameter socialLoginParameter;

  final EasyGetter<PeriodMap> periodMap;
  final EasyGetter<CalendarDayDTOMap> calendarDayDTOMap;
  final EasyGetter<CalendarDayViewModel> calendarDayViewModel;
  final EasyGetter<DBCalendarDayDtoMap> dbCalendarDayDtoMap;
  final EasyGetter<AdvicesGroupedByCategory> advicesCategories;

  /// Determine if the user is trying to log in or sign up
  final RxBool isLoginFlow;

  AppController._({
    required this.question,
    required this.user,
    required this.settings,
    required this.survey,
    required this.checkEmail,
    required this.registerParameter,
    required this.updateUserParameters,
    required this.socialLoginParameter,
    required this.periodMap,
    required this.calendarDayDTOMap,
    required this.dbCalendarDayDtoMap,
    required this.calendarDayViewModel,
    required this.isLoginFlow,
    required this.advicesCategories,
  });

  factory AppController.initial() {
    return AppController._(
      periodMap: EasyGetter<PeriodMap>(),
      calendarDayDTOMap: EasyGetter<CalendarDayDTOMap>(),
      dbCalendarDayDtoMap: EasyGetter<DBCalendarDayDtoMap>(),
      calendarDayViewModel: EasyGetter<CalendarDayViewModel>(),
      user: EasyGetter<User>(),
      question: EasyGetter<Question>(),
      settings: EasyGetter<Settings>(),
      survey: EasyGetter<Survey>(),
      checkEmail: EasyGetter<CheckEmail>(),
      registerParameter: RegistrationParameters.initial(),
      updateUserParameters: UpdateUserParameters.initial(),
      socialLoginParameter: SocialLoginParameter.initial(),
      advicesCategories: EasyGetter<AdvicesGroupedByCategory>(),
      isLoginFlow: false.obs,
    );
  }
}
