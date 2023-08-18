
class AppConstants{
  static const String APP_NAME = "histology_app";// name of app
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://histology-app.us-east-2.elasticbeanstalk.com";

  ///user endpoints
  static const String REGISTER_URI = "/api/register";
  static const String LOGIN_URI = "/api/login";
  ///user endpoints
  ///
  ///
  /// Get data endpoints
  static const String TEST = "/api/form/test";
  static const String POST_TEST = "/api/form/post-test";
  static const String ACCOUNT_DATA_URI = "/api/getAccountData";
  static const String POST_FORM = "/api/form/store-form-data";
  static const String GET_FORM = "/api/form/get-form-data";
  static const String GET_LIST_OF_FORMS = "/api/form/get-list-of-forms";
  static const String SEND_IMAGE = "/api/images/store-image";
  /// Get data endpoints

  static const String NAME = "name";
  static const String USER_ID = "user_id";//TODO: change tohi to uuid
  static const String TOKEN = "token";
  static const String HAS_LINKED_ACCOUNT = "false";

}