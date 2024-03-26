import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/isar/symptom_calendar.dart';
import 'package:lines/data/models/advices_grouped_by_category.dart';
import 'package:lines/data/models/check_email.dart';
import 'package:lines/data/models/current_period.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/new_symptom_category.dart';
import 'package:lines/data/models/period_map.dart';
import 'package:lines/data/models/period_status.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/data/models/settings.dart';
import 'package:lines/data/models/survey.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/social_login_parameter.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';

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

  final EasyGetter<CurrentPeriod> currentPeriod;
  final EasyGetter<PeriodMap> periodMap;

  final EasyGetter<RxMap<String, PeriodStatus>> periodStatusCalendar;
  final EasyGetter<RxMap<String, SymptomCalendar>> symptomsCalendar;
  final EasyGetter<AdvicesGroupedByCategory> advicesCategories;

  final EasyGetter<List<NewSymptomCategory>> symptomCategory;

  final Rxn<Mission> selectedMission = Rxn<Mission>();

  /// Determine if the user is trying to log in or sign up
  final RxBool isLoginFlow;

  final RxBool showLockPage;

  AppController._({
    required this.periodMap,
    required this.question,
    required this.user,
    required this.settings,
    required this.survey,
    required this.checkEmail,
    required this.registerParameter,
    required this.updateUserParameters,
    required this.socialLoginParameter,
    required this.currentPeriod,
    required this.periodStatusCalendar,
    required this.symptomsCalendar,
    required this.isLoginFlow,
    required this.advicesCategories,
    required this.showLockPage,
    required this.symptomCategory,
  });

  factory AppController.initial() {
    return AppController._(
      periodMap: EasyGetter<PeriodMap>(),
      symptomsCalendar: EasyGetter<RxMap<String, SymptomCalendar>>(),
      periodStatusCalendar: EasyGetter<RxMap<String, PeriodStatus>>(),
      user: EasyGetter<User>(),
      question: EasyGetter<Question>(),
      settings: EasyGetter<Settings>(),
      survey: EasyGetter<Survey>(),
      checkEmail: EasyGetter<CheckEmail>(),
      currentPeriod: EasyGetter<CurrentPeriod>(),
      registerParameter: RegistrationParameters.initial(),
      updateUserParameters: UpdateUserParameters.initial(),
      socialLoginParameter: SocialLoginParameter.initial(),
      advicesCategories: EasyGetter<AdvicesGroupedByCategory>(),
      symptomCategory: EasyGetter<List<NewSymptomCategory>>(),
      isLoginFlow: false.obs,
      showLockPage: false.obs,
    );
  }
}
