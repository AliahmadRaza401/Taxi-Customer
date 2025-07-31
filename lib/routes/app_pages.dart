import 'package:game_on/features/passenger/authentication/continue/continue_binding.dart';
import 'package:game_on/features/passenger/authentication/continue/continue_screen.dart';
import 'package:game_on/features/passenger/authentication/sign_in/sign_in_screen.dart';
import 'package:game_on/features/passenger/booking/binding/venue_booking_binding.dart';
import 'package:game_on/features/passenger/booking/view/venue_booking_home_screen.dart';
import 'package:game_on/features/passenger/confirmation/confirmation_binding.dart';
import 'package:game_on/features/passenger/confirmation/confirmation_screen.dart';
import 'package:game_on/features/passenger/notification/binding/notification_binding.dart';
import 'package:game_on/features/passenger/notification/view/notification_screen.dart';
import 'package:game_on/features/passenger/payment/binding/payment_binding.dart';
import 'package:game_on/features/passenger/payment/view/payment_screen.dart';
import 'package:game_on/features/passenger/pick_up/binding/location_binding.dart';
import 'package:game_on/features/passenger/pick_up/view/dropoff_screen.dart';
import 'package:game_on/features/passenger/pick_up/view/pickup_main_screen.dart';
import 'package:game_on/features/passenger/pick_up/view/select_pick_up_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:game_on/features/passenger/authentication/otp/otp_binding.dart';
import 'package:game_on/features/passenger/authentication/otp/otp_screen.dart';
import 'package:game_on/features/passenger/authentication/signup/signup_binding.dart';
import 'package:game_on/features/passenger/authentication/signup/signup_screen.dart';
import 'package:game_on/features/passenger/onboarding/onboarding_binding.dart';
import 'package:game_on/features/passenger/onboarding/onboarding_screen.dart';
import 'package:game_on/features/passenger/slpash/slpash_screen.dart';
import 'package:game_on/features/passenger/slpash/splash_binding.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/instance_manager.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.continueAs,
      page: () => const ContinueScreen(),
      binding: ContinueBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInScreen(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),

    GetPage(
      name: AppRoutes.venueBooking,
      page: () => VenueBookingHomeScreen(),
      binding: VenueBookingBinding(),
    ),
    GetPage(
      name: AppRoutes.pickUp,
      page: () => PickupMainScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: AppRoutes.dropoof,
      page: () => DropoffScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: AppRoutes.selectPickUp,
      page: () => SelectPickUpScreen(),
      binding: LocationBinding(),
    ),
     GetPage(
          name: AppRoutes.payment,
          page: () => PaymentScreen(),
          binding: PaymentBinding(),
        ),
        GetPage(
          name: AppRoutes.confirmation,
          page: () => ConfirmationScreen(),
          binding: ConfirmationBinding(),
        ),
        GetPage(
          name: AppRoutes.notification,
          page: () => NotificationScreen(),
          binding: NotificationBinding(),
        ),
  ];
}
