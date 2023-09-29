class AppLink {
  
  // static const String apiLink = 'http://192.168.43.198:8000/api';
  // static const String imageLink =
  //     'http://192.168.43.198/backend/mahmou-first-project_1_new-8abe3f0c54bf/storage/app/public/';
  
   
  static const String apiLink = 'http://10.0.2.2:8000/api';
  static const String imageLink =
      'http://10.0.2.2/back_eventune/back/storage/app/public/';
  static String token = '';
  // static String password = '123123';
  //=============Auth=============
  static const String login = '$apiLink/login';
  static const String register = '$apiLink/signup';
  static const String logout = '$apiLink/logout';
  static const String roleOwner = '$apiLink/roles/buyOwnerAccount';
  static const String myWallet = '$apiLink/get-wallet';
  static const String resetPassword = "$apiLink/resetPassword";
  static const String verifyCode = "$apiLink/verifyCode";
  static const String forgetPassword = "$apiLink/forgetPassword";
  //=============Venue=============
  static const String addVenue = '$apiLink/venues/add/venue';
  static const String addImagesVenue = '$apiLink/images/add/Venue/';
  static const String updateImagesVenue = '$apiLink/images/edit/Venue/';
  static const String updataVenue = '$apiLink/venues/edit/venue/';
  static const String updateTimeVenue = '$apiLink/editTimeSchedule/venue/';
  static const String updataPhoneVenue = '$apiLink/phones/edit/Venue/';
  static const String addTimeScheduleVenue = '$apiLink/AddTimeSchedule/venue/';
  static const String updateSection = '$apiLink/sections/edit/';
  static const String addSection = '$apiLink/sections/add/';
  static const String getAllForOwner = "$apiLink/venues/getAllForOwner";
  static const String allSection = "$apiLink/sections/getAll";
  static const String pendingInVenue = "$apiLink/events/GetAllRequestsForVenue";
  static const String replaypendingInVenue = "$apiLink/events/reply";
  static const String acceptInVenue = "$apiLink/events/GetAllEventsForVenue";
  static const String acceptInStore = "$apiLink/stores/orders";
  //=============stores============
  static const String addImagesStore = '$apiLink/images/add/Store/';
  static const String updateImagesStore = '$apiLink/images/edit/Store/';

  static const String addStore = '$apiLink/stores/add/store';

  static const String addTimeScheduleStore = '$apiLink/AddTimeSchedule/store/';
  static const String addProduct = '$apiLink/stores/products/add/';
  static const String getAllProduct = '$apiLink/stores/products/getAll';
  static const String allMyStores = "$apiLink/stores/getAllForOwner";
  static const String replaypendingInStore = "$apiLink/stores/request/reply";
  static const String pendingInStore = "$apiLink/stores/requests";
  static const String updateTimeStore = '$apiLink/editTimeSchedule/store/';
  static const String updataStore = '$apiLink/stores/edit/store/';
  static const String updataPhoneStore = '$apiLink/phones/edit/store/';
  //=============CreateEvent============
  static const String getAllCategory = '$apiLink/categories/getAll';
  static const String customCreateEvent = '$apiLink/events/createCustom';
  static const String createEvent = '$apiLink/events/createInVenue';
  static const String freeTimeForEvent = '$apiLink/sections/FreeTimes/';
  static const String allVenueOfCategories =
      "$apiLink/sections/getAllForCategory";
  static const String searchAllVenueOfCategories = "$apiLink/sections/Search";
  static const String rating = "$apiLink/rate";
  //=============cart==================
  static const String allStores = "$apiLink/stores/getAll";
  static const String searchStore = "$apiLink/stores/search";
  static const String addOrder = "$apiLink/stores/order/";
  //=============homepage==============
  static const String allEvents = "$apiLink/events/Home";
  static const String suggestionEvents = "$apiLink/events/suggestions";
  static const String searchHomePage = "$apiLink/events/search";
  static const String myEvents = "$apiLink/events/GetAllForUser";
  static const String promotSuggetion = "$apiLink/promotions/promote/1/";
  static const String promotNotification = "$apiLink/promotions/promote/2/";
  static const String feedBack = "$apiLink/feedbacks/add";
  static const String registeredEvents = "$apiLink/events/attender-events";
  //=============myOrder==============
  static const String userOrders = "$apiLink/orders/user-orders";
  //=============comment==============
  static const String makeComment = "$apiLink/events/comments/add";
  static const String allComments = "$apiLink/events/comments/getAll";
  //=============buyTicket==============
  static const String attendEvent = "$apiLink/events/register/placed";
  static const String getinfoEventWithoutAuthrize = "$apiLink/events/get/";
  static const String replyInviteEventByDeepLink =
      "$apiLink/invitations/linkReply/";
  //placed/eventId/accept
}
