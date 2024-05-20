import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_grouped_by_category.dart';
import 'package:lines/data/models/badge.dart';
import 'package:lines/data/models/calendar_data.dart';
import 'package:lines/data/models/check_email.dart';
import 'package:lines/data/models/current_period.dart';
import 'package:lines/data/models/menses_statistics.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/period_map.dart';
import 'package:lines/data/models/periods_stats.dart';
import 'package:lines/data/models/product_category.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/data/models/send_confirm_email.dart';
import 'package:lines/data/models/settings.dart';
import 'package:lines/data/models/specific_date_period_stats.dart';
import 'package:lines/data/models/survey.dart';
import 'package:lines/data/models/symptom_category.dart';
import 'package:lines/data/models/symptom_diaries.dart';
import 'package:lines/data/models/symtpom_category_stats.dart';
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

  final EasyGetter<NewCalendarData> calendarData;

  final EasyGetter<AdvicesGroupedByCategory> advicesCategories;

  final EasyGetter<List<AdvicesArticle>> suggestedAdvicesArticle;

  final EasyGetter<List<SymptomCategory>> symptomCategory;

  final EasyGetter<List<SymptomCategory>> categoriesSavedInHome;

  final EasyGetter<SymptomDiaries> symptomsDiaries;

  final EasyGetter<List<Badge>> badges;

  final EasyGetter<List<PeriodsStats>> periodsStats;

  final EasyGetter<SpecificDatePeriodsStats> specificDatePeriodsStats;

  final EasyGetter<List<ProductCategory>> productCategory;
  final EasyGetter<SymptomCategoryStats> symptomCategoryStats;
  final EasyGetter<List<Mission>> missions;
  final EasyGetter<List<MensesStatistics>> mensesStatistics;
  final EasyGetter<SendConfirmEmail> sendConfirmEmail;

  final EasyGetter<AdvicesArticle> singleArticle;

  /// Determine if the user is trying to log in or sign up
  final RxBool isLoginFlow;

  final RxBool showLockPage;

  final RxBool hasUsedDeepLink;

  AppController._({
    required this.periodMap,
    required this.calendarData,
    required this.question,
    required this.user,
    required this.settings,
    required this.survey,
    required this.checkEmail,
    required this.registerParameter,
    required this.updateUserParameters,
    required this.socialLoginParameter,
    required this.currentPeriod,
    required this.isLoginFlow,
    required this.advicesCategories,
    required this.suggestedAdvicesArticle,
    required this.showLockPage,
    required this.symptomCategory,
    required this.categoriesSavedInHome,
    required this.periodsStats,
    required this.specificDatePeriodsStats,
    required this.productCategory,
    required this.symptomCategoryStats,
    required this.singleArticle,
    required this.missions,
    required this.mensesStatistics,
    required this.symptomsDiaries,
    required this.sendConfirmEmail,
    required this.badges,
    required this.hasUsedDeepLink,
  });

  factory AppController.initial() {
    return AppController._(
      periodMap: EasyGetter<PeriodMap>(),
      calendarData: EasyGetter<NewCalendarData>(),
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
      suggestedAdvicesArticle: EasyGetter<List<AdvicesArticle>>(),
      symptomCategory: EasyGetter<List<SymptomCategory>>(),
      categoriesSavedInHome: EasyGetter<List<SymptomCategory>>(),
      symptomsDiaries: EasyGetter<SymptomDiaries>(),
      badges: EasyGetter<List<Badge>>(),
      periodsStats: EasyGetter<List<PeriodsStats>>(),
      specificDatePeriodsStats: EasyGetter<SpecificDatePeriodsStats>(),
      productCategory: EasyGetter<List<ProductCategory>>(),
      symptomCategoryStats: EasyGetter<SymptomCategoryStats>(),
      missions: EasyGetter<List<Mission>>(),
      mensesStatistics: EasyGetter<List<MensesStatistics>>(),
      sendConfirmEmail: EasyGetter<SendConfirmEmail>(),
      singleArticle: EasyGetter<AdvicesArticle>(),
      isLoginFlow: false.obs,
      showLockPage: false.obs,
      hasUsedDeepLink: false.obs,
    );
  }
}
