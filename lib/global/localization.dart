import "package:get/get.dart";

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          // Splash Page
          "splash.title": "Splash page",

          // SignIn Page
          "auth.signIn.headerTitle": "Login",
          "auth.signIn.emailHint": "Enter your email",
          "auth.signIn.emailInvalidate": "Please enter some text",
          "auth.signIn.passwordHint": "Enter your password",
          "auth.signInButton": "Sign In",
          "commons.nextButton": "Next",

          // Home page
          "home.title": "Home Page",
          "home.button.signOut": "Sign Out",
          "home.settings.language": "Language",
        },
        "vi": {
          // Splash Page
          "splash.title": "Trang Splash",

          // SignIn Page
          "auth.signIn.headerTitle": "Đăng nhập",
          "auth.signIn.emailHint": "Nhập Email",
          "auth.signIn.emailInvalidate": "Email không hợp lệ",
          "auth.signIn.passwordHint": "Nhập mật khẩu",
          "auth.signInButton": "Đăng nhập",
          "commons.nextButton": "Tiếp",
          "home.button.signOut": "Đăng xuất",
          "home.settings.language": "Ngôn ngữ",

          // Home page
          "home.title": "Trang chủ",
        },
      };
}
