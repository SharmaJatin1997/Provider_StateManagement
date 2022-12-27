
class ApiConstants{
  static const String baseUrl = "http://3.20.42.152:8018/api";
  static const String securityKey = "vismed";
  static const String socketUrl = "http://3.20.42.152:8018";
  static const String signUpUrl = "${baseUrl}/signup";
  static const String verificationUrl = "${baseUrl}/verify_otp";
  static const String loginUrl = "${baseUrl}/login";
  static const String forgotPassUrl = "${baseUrl}/forgot_password";
  static const String getSupervisorUrl = "${baseUrl}/get_supervisor?limit=15&page=1";
  static const String resendOtpUrl = "${baseUrl}/resend_otp";
  static const String  getUserProfileUrl= "${baseUrl}/get_profile";
  static const String  updateUserProfileUrl= "${baseUrl}/edit_profile";
  static const String  logoutUrl= "${baseUrl}/logout";
  static const String  changePasswordUrl= "${baseUrl}/changePassword";
  static const String  termsUrl= "${baseUrl}/get_pages";
  static const String  aboutUsUrl= "${baseUrl}/get_pages";
  static const String  privacyUrl= "${baseUrl}/get_pages";
  static const String  getDoctorUrl= "${baseUrl}/get_doctor";
  static const String  getDoctorInfoUrl= "${baseUrl}/doctor_detail";
  static const String  addAppointmentUrl= "${baseUrl}/add_appointment";
  static const String  getAppointments= "${baseUrl}/get_appointment";
  static const String  appointmentsDetails= "${baseUrl}/appointment_detail";
  static const String  updateAppointment= "${baseUrl}/update_appointment";
  static const String  addExpenses= "${baseUrl}/add_expenses";
  static const String  getExpenses= "${baseUrl}/get_expenses";



}