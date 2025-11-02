import 'package:go_router/go_router.dart';
import '../../presentation/auth/language_screen.dart';
import '../../presentation/auth/login_screen.dart';
import '../../presentation/auth/splash_screen.dart';
import '../../presentation/auth/otp_screen.dart';
import '../../presentation/auth/register_screen.dart';
import '../../presentation/auth/verify_screen.dart';
import '../../presentation/navigation/main_nav_screen.dart';
import '../../presentation/services/service_detail_screen.dart';
import '../../presentation/bookings/booking_screen.dart';
import '../../presentation/bookings/review_screen.dart';
import '../../presentation/bookings/success_screen.dart';
import '../../presentation/support/support_chat_screen.dart';
import '../../presentation/bookings/booking_step1_screen.dart';
import '../../presentation/bookings/booking_step2_screen.dart';
import '../../presentation/bookings/order_tracking_screen.dart';
import '../../presentation/bookings/order_review_screen.dart';
import '../../presentation/bookings/order_complete_screen.dart';
import '../../presentation/profile/edit_profile_screen.dart';
import '../../presentation/auth/forgot_password_screen.dart';
import '../../presentation/address/add_new_address.dart';
import '../../presentation/address/location_selection_screen.dart';
import '../../presentation/address/address_list.dart';



final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const LanguageScreen()),
    GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
    GoRoute(
      path: '/otp',
      builder: (context, state) {
        final phone = state.extra as String? ?? '';
        return OtpScreen(phone: phone);
      },
    ),

    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
    GoRoute(path: '/verify', builder: (_, __) => const VerifyScreen()),
    GoRoute(path: '/forgot', builder: (_, __) => const ForgotPasswordScreen()),

    // ✅ Main Navigation
    GoRoute(path: '/home', builder: (_, __) => const MainNavScreen()),

    // 🧩 Services & Bookings
    GoRoute(
      path: '/service/:id',
      builder: (context, state) => ServiceDetailScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/booking/:id',
      builder: (context, state) => BookingScreen(serviceId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/review',
      builder: (context, state) => ReviewScreen(bookingData: state.extra as Map<String, dynamic>),
    ),
    GoRoute(path: '/success', builder: (_, __) => const SuccessScreen()),

    // 💬 Support
    GoRoute(path: '/support', builder: (_, __) => const SupportChatScreen()),

    GoRoute(
      path: '/booking-step1/:service',
      builder: (context, state) =>
          BookingStep1Screen(serviceName: state.pathParameters['service']!),
    ),
    GoRoute(
      path: '/booking-step2',
      builder: (context, state) =>
          BookingStep2Screen(bookingData: state.extra as Map<String, dynamic>),
    ),
    GoRoute(
      path: '/order-review',
      builder: (context, state) =>
          OrderReviewScreen(bookingData: state.extra as Map<String, dynamic>),
    ),
    GoRoute(path: '/order-complete', builder: (_, __) => const OrderCompleteScreen()),
    GoRoute(path: '/order-tracking', builder: (_, __) => const OrderTrackingScreen()),

    // user
    GoRoute(path: '/edit-profile', builder: (_, __) => const EditProfileScreen()),
    GoRoute(path: '/location', builder: (_, __) => const LocationSelectionScreen()),
    GoRoute(path: '/addresses', builder: (_, __) => const AddressListScreen()),
    GoRoute(path: '/add-address', builder: (_, __) => const AddAddressScreen()),



  ],
);
