import 'package:fro9/features/authentification/screens/login/login.dart';
import 'package:fro9/features/authentification/screens/onboarding/onboarding.dart';
import 'package:fro9/features/authentification/screens/password/configuration/forget_password.dart';
import 'package:fro9/features/authentification/screens/signup/signup.dart';
import 'package:fro9/features/authentification/screens/signup/verify_email.dart';
import 'package:fro9/features/personalization/screens/adress/address.dart';
import 'package:fro9/features/personalization/screens/profile/profile.dart';
import 'package:fro9/features/personalization/screens/settings/settings.dart';
import 'package:fro9/features/shop/models/product_model.dart';
import 'package:fro9/features/shop/screens/cart/cart.dart';
import 'package:fro9/features/shop/screens/home/home.dart';
import 'package:fro9/features/shop/screens/order/orders.dart';
import 'package:fro9/features/shop/screens/product_details/product_details.dart';
import 'package:fro9/features/shop/screens/store/store.dart';
import 'package:fro9/features/shop/screens/wishlist/wishlist.dart';
import 'package:fro9/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.store, page: () => StoreScrenn()),
    GetPage(name: TRoutes.favourites, page: () => FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => ProductDetails(product: ProductModel.empty(),)),
    GetPage(name: TRoutes.order, page: () => OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => HomeScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => OnBoardingScreen()),
  ];
}
