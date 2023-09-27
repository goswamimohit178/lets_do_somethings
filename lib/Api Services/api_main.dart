class ApiConstants {
//  *******    BASE URL OF THE PROJECT *******   //
  static String BASE_URL = 'https://lets_do_somethings.com';

// ******  END POINT FOR GET THE AUTH TOKEN   ******** //
  static String AUTH_TOKEN = '/API_DEMO/Auth2/token';

// ******  END POINT FOR  GENERATE OTP   ******** //
  static String SIGN_UP = '/API_demo/api/SalesPartner/SignUpIn';

// ******  END POINT FOR OTP VERIFICATION     ******** //
  static String OTP_VERIFICATION = '/API_demo/api/SalesPartner/OTPVerification';

  // ******  END POINT FOR CANDIDATE KYC DETAILS     ******** //
  static String CANDIDATE_KYC = '/API_demo/api/SalesPartner/CandidateKYCDetail';

  // ******  END POINT FOR GET SEGMENT LIST     ******** //
  static String GET_SIGMENT_LIST = '/API_demo/api/Business/GetSegment';

  // ******  END POINT FOR GET BUSSINESS LIST     ******** //
  static String GET_BUSSINESS_LIST = '/API_demo/api/Business/GetBusinesses';

  // ******  END POINT FOR GET BUSSINESS DETAILS    ******** //
  static String GET_BUSSINESS_DETAILS =
      '/API_demo/api/Business/GetBusinessDetail';

  // ******  END POINT FOR GET CUSTOMER LEAD RESOURCES     ******** //
  static String GET_LEAD_RESOURCES =
      '/API_demo/api/SalesPartner/GetCustomerLeadResources';

  // ******  END POINT FOR GET CANDIDATE CUSTOMER LEAD    ******** //
  static String GET_CANDIDATE_CUSTOMER_LEAD =
      '/API_demo/api/SalesPartner/GetCandidateCustomerLead';

  // ******  END POINT FOR GET CITY LIST    ******** //
  static String GET_CITY_LIST = '/API_demo/api/SalesPartner/GetStateCities';

// ******  END POINT FOR PRODUCT LIST ACCORDING TO BUSSINESS LIST    ******** //
  static String GET_PRODUCT_LIST =
      '/API_demo/api/SalesPartner/GetBusinessProducts';

  // ******  END POINT FOR ADD AND EDIT CUSTOMER LEAD     ******** //
  static String ADD_EDIT_CUSTOMER_LEAD =
      '/API_demo/api/SalesPartner/AddEditCustomerLead';
}
