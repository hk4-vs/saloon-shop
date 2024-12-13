import 'package:barber/views/default_route.dart';
import 'package:barber/views/login/forgot_password.dart';
import 'package:barber/views/user-register/register_view.dart';
import 'package:barber/views/user/bookings-preview/booking_confirmation_view.dart';
import 'package:barber/views/user/bookings-preview/booking_preview_view.dart';
import 'package:barber/views/user/saloon-details/saloon_details_view.dart';
import 'package:flutter/material.dart';

import '../../views/login/login_view.dart';

import '../../views/user-register/otp_verification_view.dart';
import '../../views/user/dashboard/dashboard_view.dart';
import 'route_arguments.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordPage());
      case RouteNames.userDashboardView:
        return MaterialPageRoute(
            builder: (context) => const UserDashboardView());
      case RouteNames.userRegisterView:
        return MaterialPageRoute(
            builder: (context) => const UserRegisterView());

      case RouteNames.saloonDetailsView:
        return MaterialPageRoute(
            builder: (context) => const SaloonDetailsView());
      case RouteNames.bookingPreviewView:
        return MaterialPageRoute(
            builder: (context) => const BookingPreviewView());
             case RouteNames.bookingConfirmationView:
        return MaterialPageRoute(
            builder: (context) => const BookingConfirmationView());

      case RouteNames.userOtpVerificationView:
        Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => OtpVerificationView(
                  userRegistrationModel:
                      arguments[RouteArguments.userRegistrationModel],
                ));

      default:
        return MaterialPageRoute(builder: (context) => const DefaultRoute());
    }
  }
}
