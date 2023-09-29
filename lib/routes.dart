import 'package:get/get.dart';
import 'package:Eventune/view/screen/auth/loginScreen.dart';
import 'package:Eventune/view/screen/auth/signupScreen.dart';
import 'package:Eventune/view/screen/cart/allStores.dart';
import 'package:Eventune/view/screen/cart/cartScreen.dart';
import 'package:Eventune/view/screen/cart/productsScreen.dart';
import 'package:Eventune/view/screen/cart/searchStores.dart';
import 'package:Eventune/view/screen/cart/storeDetailsScreen.dart';
import 'package:Eventune/view/screen/createEvent/allSectionOfVenueofCategories.dart';
import 'package:Eventune/view/screen/createEvent/allVenueOfCategories.dart';
import 'package:Eventune/view/screen/createEvent/checkScheduleScreen.dart';
import 'package:Eventune/view/screen/createEvent/detailsEventPlaceScreen.dart';
import 'package:Eventune/view/screen/createEvent/insideSectionOfCategories.dart';
import 'package:Eventune/view/screen/createEvent/insideVenueOfCategories.dart';
import 'package:Eventune/view/screen/createEvent/searchAllVenueOfCategories.dart';
import 'package:Eventune/view/screen/eventDetails/chatScreen.dart';
import 'package:Eventune/view/screen/eventDetails/confirmBuyTicketScreen.dart';
import 'package:Eventune/view/screen/eventDetails/eventDetalisScreen.dart';
import 'package:Eventune/view/screen/eventDetails/lastConfirmBuyTicketScreen.dart';
import 'package:Eventune/view/screen/homepage/eventDetials.dart';
import 'package:Eventune/view/screen/homepage/feedBack.dart';
import 'package:Eventune/view/screen/homepage/searchHomePage.dart';
import 'package:Eventune/view/screen/myOrder/detailsOrderScreen.dart';
import 'package:Eventune/view/screen/myTicket/registeredEventsDetails.dart';
import 'package:Eventune/view/screen/store/allMyStores.dart';
import 'package:Eventune/view/screen/store/appTabStores.dart';
import 'package:Eventune/view/screen/store/myProducts.dart';
import 'package:Eventune/view/screen/store/storeMyTimes.dart';
import 'package:Eventune/view/screen/venue/allMyVenues.dart';
import 'package:Eventune/view/screen/venue/appTab.dart';
import 'package:Eventune/view/screen/venue/checkSection.dart';
import 'package:Eventune/view/screen/venue/sections.dart';
import 'package:Eventune/view/screen/venue/venueMyTimes.dart';
import 'package:Eventune/view/screen/homepage/bottomnav.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignupScreen(),
  ),
  GetPage(
    name: AppRoute.eventDetails,
    page: () => const EventDetailsScreen(),
  ),
  GetPage(
    name: AppRoute.confirmBuyTicket,
    page: () => const ConfirmBuyTicketScreen(),
  ),
  GetPage(
    name: AppRoute.lastConfirmBuyTicket,
    page: () => const LastConfirmBuyTicket(),
  ),
  GetPage(
    name: AppRoute.detailsOrderScreen,
    page: () => const DetailsOrderScreen(),
  ),
  GetPage(
      name: "/registeredEventsDetails",
      page: () => const registeredEventsDetails()),
  GetPage(
    name: AppRoute.detailsEventPlaceScreen,
    page: () => const DetailsEventPlaceScreen(),
  ),
  GetPage(
    name: AppRoute.checkScheduleScreen,
    page: () => const CheckScheduleScreen(),
  ),
  GetPage(
    name: AppRoute.cartScreen,
    page: () => const CartScreen(),
  ),
  GetPage(
      name: AppRoute.allVenueOfCategories,
      page: () => const AllVenueOfCategories()),
  GetPage(
      name: AppRoute.insideVenueOfCategories,
      page: () => const InsideVenueOfCategories()),
  GetPage(
      name: AppRoute.allSectionOfVenueofCategories,
      page: () => const AllSectionOfVenueofCategories()),
  GetPage(
      name: AppRoute.insideSectionOfCategories,
      page: () => const InsideSectionOfCategories()),
  GetPage(
      name: AppRoute.searchAllVenueOfCategories,
      page: () => const SearchAllVenueOfCategories()),
  GetPage(name: AppRoute.allStores, page: () => const AllStores()),
  GetPage(name: AppRoute.storeDetails, page: () => const StoreDetails()),
  GetPage(name: AppRoute.products, page: () => const ProductsScreen()),
  GetPage(name: AppRoute.createEvent5, page: () => const CreateEvent5()),
  GetPage(name: AppRoute.searchStores, page: () => const SearchStores()),
  GetPage(name: AppRoute.myEventDetails, page: () => const EventDetials()),

  GetPage(name: "/allMyVenues", page: () => const AllMyVenues()),
  GetPage(name: "/appTab", page: () => const AppTab()),
  GetPage(name: "/venueMyTimes", page: () => const VenueMyTimes()),
  GetPage(name: "/sections", page: () => const Sections()),
  GetPage(name: "/checkSection", page: () => const CheckSection()),
  GetPage(name: "/allMyStores", page: () => const AllMyStores()),
  GetPage(name: "/storeMyTimes", page: () => const StoreMyTimes()),
  GetPage(name: "/appTabStores", page: () => const AppTabStores()),
  GetPage(name: AppRoute.bottomnav, page: () => const bottomnav()),
  // GetPage(name: AppRoute.eventDetails, page: () => const EventDetials()),
  GetPage(name: AppRoute.searchHomePage, page: () => const SearchHomePage()),
  GetPage(name: AppRoute.allMyVenues, page: () => const AllMyVenues()),
  GetPage(name: AppRoute.chat, page: () => const ChatScreen()),
  GetPage(name: "/feedBack", page: () => const FeedBack()),
];
