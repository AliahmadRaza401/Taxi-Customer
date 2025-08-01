import 'package:game_on/features/passenger/activities/Activities_screen.dart';
import 'package:game_on/features/passenger/activities/activities_binding.dart';
import 'package:game_on/features/passenger/authentication/continue/continue_binding.dart';
import 'package:game_on/features/passenger/authentication/continue/continue_screen.dart';
import 'package:game_on/features/passenger/authentication/sign_in/sign_in_screen.dart';
import 'package:game_on/features/passenger/booking/binding/venue_booking_binding.dart';
import 'package:game_on/features/passenger/booking/view/venue_booking_home_screen.dart';
import 'package:game_on/features/passenger/chat/binding/chat_binding.dart';
import 'package:game_on/features/passenger/chat/view/chat_screen.dart';
import 'package:game_on/features/passenger/confirmation/confirmation_binding.dart';
import 'package:game_on/features/passenger/confirmation/confirmation_screen.dart';
import 'package:game_on/features/passenger/driver_found/binding/driver_found_binding.dart';
import 'package:game_on/features/passenger/driver_found/view/driver_found_screen.dart';
import 'package:game_on/features/passenger/invite_friend/invite_friend_binding.dart';
import 'package:game_on/features/passenger/invite_friend/invite_friend_refer_screen.dart';
import 'package:game_on/features/passenger/invite_friend/invite_friend_screen.dart';
import 'package:game_on/features/passenger/notification/binding/notification_binding.dart';
import 'package:game_on/features/passenger/notification/view/notification_screen.dart';
import 'package:game_on/features/passenger/payment/binding/payment_binding.dart';
import 'package:game_on/features/passenger/payment/view/payment_screen.dart';
import 'package:game_on/features/passenger/personal_details/personal_details_binding.dart';
import 'package:game_on/features/passenger/personal_details/personal_details_screen.dart';
import 'package:game_on/features/passenger/pick_up/binding/location_binding.dart';
import 'package:game_on/features/passenger/pick_up/view/dropoff_screen.dart';
import 'package:game_on/features/passenger/pick_up/view/pickup_main_screen.dart';
import 'package:game_on/features/passenger/pick_up/view/select_pick_up_screen.dart';
import 'package:game_on/features/passenger/profile/profile_binding.dart';
import 'package:game_on/features/passenger/profile/profile_screen.dart';
import 'package:game_on/features/passenger/report/report_binding.dart';
import 'package:game_on/features/passenger/report/report_detail_screen.dart';
import 'package:game_on/features/passenger/report/report_screen.dart';
import 'package:game_on/features/passenger/ride_details/ride_details_binding.dart';
import 'package:game_on/features/passenger/ride_details/ride_details_screen.dart';
import 'package:game_on/features/passenger/ride_history/ride_history_binding.dart';
import 'package:game_on/features/passenger/ride_history/ride_history_screen.dart';
import 'package:game_on/features/passenger/ride_map/ride_map_binding.dart';
import 'package:game_on/features/passenger/ride_map/ride_map_screen.dart';
import 'package:game_on/features/passenger/sos/binding/sos_binding.dart';
import 'package:game_on/features/passenger/sos/view/sos_screen.dart';
import 'package:game_on/features/passenger/support_chat/support_chat_binding.dart';
import 'package:game_on/features/passenger/support_chat/support_chat_screen.dart';
import 'package:game_on/features/passenger/trip_end/binding/trip_end_binding.dart';
import 'package:game_on/features/passenger/trip_end/view/trip_end_screen.dart';
import 'package:game_on/features/passenger/update_email/update_email_binding.dart';
import 'package:game_on/features/passenger/update_email/update_email_screen.dart';
import 'package:game_on/features/passenger/update_mobile/update_mobile_binding.dart';
import 'package:game_on/features/passenger/update_mobile/update_mobile_screen.dart';
import 'package:game_on/features/passenger/update_name/update_name_binding.dart';
import 'package:game_on/features/passenger/update_name/update_name_screen.dart';
import 'package:game_on/features/passenger/update_password/update_password_binding.dart';
import 'package:game_on/features/passenger/update_password/update_password_screen.dart';
import 'package:game_on/features/passenger/waiting_driver/binding/waiting_driver_binding.dart';
import 'package:game_on/features/passenger/waiting_driver/view/waiting_driver_screen.dart';
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

    GetPage(
      name: AppRoutes.waitingDriver,
      page: () => WaitingDriverScreen(),
      binding: WaitingDriverBinding(),
    ),
    GetPage(
      name: AppRoutes.driverFound,
      page: () => DriverFoundScreen(),
      binding: DriverFoundBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(name:AppRoutes.sos, page: () => SosScreen(), binding: SosBinding()),
    GetPage(
      name: AppRoutes.tripEnd,
      page: () => TripEndScreen(),
      binding: TripEndBinding(),
    ),




        GetPage(
      name: AppRoutes.inviteFriend,
      page: () => InviteFriendScreen(),
      binding: InviteFriendBinding(),
    ),
    GetPage(
      name: AppRoutes.inviteFriendRefer,
      page: () => InviteFriendReferScreen(),
      binding: InviteFriendBinding(),
    ),
    GetPage(
      name: AppRoutes.supportChat,
      page: () => SupportChatScreen(),
      binding: SupportChatBinding(),
    ),



GetPage(
          name: AppRoutes.activities,
          page: () => ActivitiesScreen(),
          binding: ActivitiesBinding(),
        ),
        GetPage(
          name: AppRoutes.rideHistory,
          page: () => RideHistoryScreen(),
          binding: RideHistoryBinding(),
        ),
        GetPage(
          name:AppRoutes.rideDetails,
          page: () => RideDetailsScreen(),
          binding: RideDetailsBinding(),
        ),
        GetPage(
          name: AppRoutes.rideMap,
          page: () => RideMapScreen(),
          binding: RideMapBinding(),
        ),







GetPage(
          name: AppRoutes.profile,
          page: () => ProfileScreen(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: '/personal-details',
          page: () => PersonalDetailsScreen(),
          binding: PersonalDetailsBinding(),
        ),
        GetPage(
          name: '/update-name',
          page: () => UpdateNameScreen(),
          binding: UpdateNameBinding(),
        ),
        GetPage(
          name: '/update-mobile',
          page: () => UpdateMobileScreen(),
          binding: UpdateMobileBinding(),
        ),
        GetPage(
          name: '/update-email',
          page: () => UpdateEmailScreen(),
          binding: UpdateEmailBinding(),
        ),
        GetPage(
          name: '/update-password',
          page: () => UpdatePasswordScreen(),
          binding: UpdatePasswordBinding(),
        ),


GetPage(
    name: AppRoutes.report,
    page: () => ReportScreen(),
    binding: ReportBinding(),
  ),
  GetPage(
    name: AppRoutes.reportDetails,
    page: () => ReportDetailScreen(),
    binding: ReportBinding(), // Same Binding to share controller instance
  ),
  ];
}
