import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
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
import 'package:lines/data/models/update_password.dart';
import 'package:lines/data/models/uploaded_product.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/data/models/validate_referral_code.dart';
import 'package:lines/modules/mission_completed/arguments/mission_completed_arguments.dart';
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
  EasyGetter<User> user;
  EasyGetter<Question> question;
  EasyGetter<Settings> settings;
  EasyGetter<Survey> survey;
  EasyGetter<CheckEmail> checkEmail;

  /// The parameter used to register the user
  RegistrationParameters registerParameter;

  UpdateUserParameters updateUserParameters;

  SocialLoginParameter socialLoginParameter;

  EasyGetter<CurrentPeriod> currentPeriod;
  EasyGetter<PeriodMap> periodMap;

  EasyGetter<NewCalendarData> calendarData;

  EasyGetter<AdvicesGroupedByCategory> advicesCategories;

  EasyGetter<List<AdvicesArticle>> suggestedAdvicesArticle;

  EasyGetter<List<SymptomCategory>> symptomCategory;

  EasyGetter<List<SymptomCategory>> categoriesSavedInHome;

  EasyGetter<SymptomDiaries> symptomsDiaries;
  EasyGetter<List<Map<String, dynamic>>> symptomsDiariesHistory;

  EasyGetter<List<Badge>> badges;

  EasyGetter<List<PeriodsStats>> periodsStats;

  EasyGetter<SpecificDatePeriodsStats> specificDatePeriodsStats;

  EasyGetter<List<ProductCategory>> productCategory;
  EasyGetter<SymptomCategoryStats> symptomCategoryStats;

  EasyGetter<List<Mission>> missions;
  EasyGetter<List<MensesStatistics>> mensesStatistics;
  EasyGetter<SendConfirmEmail> sendConfirmEmail;
  EasyGetter<UpdatePassword> updatePassword;
  EasyGetter<AdvicesArticle> singleArticle;
  EasyGetter<ValidateReferralCode> validateReferralCode;
  Rx<MissionCompletedArguments> missionCompletedArguments;
  EasyGetter<UploadedProduct> uploadedProduct;

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
    required this.symptomsDiariesHistory,
    required this.sendConfirmEmail,
    required this.updatePassword,
    required this.missionCompletedArguments,
    required this.uploadedProduct,
    required this.badges,
    required this.hasUsedDeepLink,
    required this.validateReferralCode,
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
      symptomsDiariesHistory: EasyGetter<List<Map<String, dynamic>>>(),
      badges: EasyGetter<List<Badge>>(),
      periodsStats: EasyGetter<List<PeriodsStats>>(),
      specificDatePeriodsStats: EasyGetter<SpecificDatePeriodsStats>(),
      productCategory: EasyGetter<List<ProductCategory>>(),
      symptomCategoryStats: EasyGetter<SymptomCategoryStats>(),
      missions: EasyGetter<List<Mission>>(),
      mensesStatistics: EasyGetter<List<MensesStatistics>>(),
      sendConfirmEmail: EasyGetter<SendConfirmEmail>(),
      updatePassword: EasyGetter<UpdatePassword>(),
      singleArticle: EasyGetter<AdvicesArticle>(),
      validateReferralCode: EasyGetter<ValidateReferralCode>(),
      missionCompletedArguments: MissionCompletedArguments.initial().obs,
      uploadedProduct: EasyGetter<UploadedProduct>(),
      isLoginFlow: false.obs,
      showLockPage: false.obs,
      hasUsedDeepLink: false.obs,
    );
  }

  void initializeState() {
    periodMap = EasyGetter<PeriodMap>();
    calendarData = EasyGetter<NewCalendarData>();
    user = EasyGetter<User>();
    question = EasyGetter<Question>();
    settings = EasyGetter<Settings>();
    survey = EasyGetter<Survey>();
    checkEmail = EasyGetter<CheckEmail>();
    currentPeriod = EasyGetter<CurrentPeriod>();
    registerParameter = RegistrationParameters.initial();
    updateUserParameters = UpdateUserParameters.initial();
    socialLoginParameter = SocialLoginParameter.initial();
    advicesCategories = EasyGetter<AdvicesGroupedByCategory>();
    suggestedAdvicesArticle = EasyGetter<List<AdvicesArticle>>();
    symptomCategory = EasyGetter<List<SymptomCategory>>();
    categoriesSavedInHome = EasyGetter<List<SymptomCategory>>();
    symptomsDiaries = EasyGetter<SymptomDiaries>();
    symptomsDiariesHistory = EasyGetter<List<Map<String, dynamic>>>();
    badges = EasyGetter<List<Badge>>();
    periodsStats = EasyGetter<List<PeriodsStats>>();
    specificDatePeriodsStats = EasyGetter<SpecificDatePeriodsStats>();
    productCategory = EasyGetter<List<ProductCategory>>();
    symptomCategoryStats = EasyGetter<SymptomCategoryStats>();
    missions = EasyGetter<List<Mission>>();
    mensesStatistics = EasyGetter<List<MensesStatistics>>();
    sendConfirmEmail = EasyGetter<SendConfirmEmail>();
    updatePassword = EasyGetter<UpdatePassword>();
    singleArticle = EasyGetter<AdvicesArticle>();
    validateReferralCode = EasyGetter<ValidateReferralCode>();
    missionCompletedArguments = MissionCompletedArguments.initial().obs;
    uploadedProduct = EasyGetter<UploadedProduct>();
    isLoginFlow.value = false;
    showLockPage.value = false;
    hasUsedDeepLink.value = false;

    HiveManager.removeAcceptedCookie();
  }
}
