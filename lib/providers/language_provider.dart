import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool isEn = true;
  bool isLoading = false;

  Map<String, String> textAr = {
    //menu
    'Settings': 'إعدادات',
    'english': 'الإنكليزية',
    'arabic': 'العربية',
    'About us': 'حولنا',
    'Logout': 'تسجيل خروج',

    //profile
    'My Exhibition': 'معارضي',
    'My Booths': 'حجراتي',
    //welcome
    " Bring your exhibition event\n management to the next level\n with us":
        'احضر المعرض الخاص بك وقم بإدارته معنا',
    "Get started": 'البدء',
    //home page
    "Happening Now": 'يحدث الآن',
    //sign up
    "Validated": 'تم التحقق من صحتها',
    "Not Validated": 'لم يتم التحقق من صحتها',
    'Welcome': 'مرحباً',
    'email': 'البريد الإلكتروني',
    'username': 'اسم المستخدم',
    'Password': 'كلمة المرور',
    'confirm Password': 'تأكيد كلمة المرور',
    "Submit": "تأكيد",
    //notification
    'NEWS': 'الإشعارات',

    //manage booth
    'company name': 'اسم الشركة',
    'About': 'حول',
    'Brochure': 'بروشّور',
    'Products': 'المنتجات',
    'Announcement': 'إعلان',
    'Reviews': 'التعليقات',
    'About us': 'حولنا',
    'Edit email': 'تعديل البريد الإلكتروني',
    'OK': 'موافق',
    'Cancel': 'إلغاء',
    "phone": 'الرقم',
    'Edit phoneNumber': 'تعديل الرقم',
    'fax': 'فاكس',
    'Edit fax': 'تعديل الفاكس',
    'My Products': 'منتجاتي',
    'Add a product': 'إضافة إلى النتجات',
    ' Are you sure you want to delete this product?':
        'هل أنت متأكد من حذف هذا المنتج',
    'delete': 'حذف',
    'Product name': 'اسم المنتج',
    'Product price': 'سعر المنتج',
    "add the product": 'إضافة إلى المنتجات',
    'Conferences': 'المؤتمرات',
    'Sales': 'التخفيضات',
    'no image was selected': "لا يوجد صور محددة",
    'My Announcements': "مؤتمرات",
    'Make Announcement': "صنع إعلان",
    'Add a sale': "إضافة تخفيضات",
    'Step 1': "الخطوة 1",
    'From': 'من',
    'To': "إلى",
    'Discount': "تخفيض",
    'Hold a conference': 'إقامة مؤتمر',
    'choose date': "اختر تاريخ",
    'choose time': 'اختر وقت',
    'Home': "الصفحة الرئيسية",
    'profile': "الملف الشخصي",
    'other': "أخرى",
    "Visit": "زائر",
    "Invest": "مستثمر",
    "View Requests":" عرض الطلبات",
    'Choose booth':'اختر حجرة',
    'Time period':'فترة زمنية',
    "Apply":"تقديم",
    'Step 2':"الخطوة 2",
    'please enter the date':"الرجاء إدخال التاريخ",
    'Syria':"سوريا",
    'Lebanon':"لبنان",
    'Sudan':"سودان",
    'Russia':"روسيا",
    'India':"هند",
    'Armenia':"أرمينيا",
    'Belarus':'بيلاروسيا',
    'Brazil':"برازيل",
    'Egypt':'مصر',
    'Iran':'إيران',
    'Jordan':'أردن',
    'Oman':"عمان",
    'palestine':"فلسطين",
    'Pakistan':"باكستان",
    'Qatar':"قطر",
    'United-Arab-Emirates':"الإمارات العربية المتحدة",
    'Philippines':"فلبين",
    'Sorry':"اسف",
    'try again':'أعد المحاولة',
    'Personl informaiton':"معلومات شخصية",
    'First name':"الاسم الأول",
    'first name  must not be empty':"الاسم الأول يجب ألا يكون فارغ",
    'Last Name':"الاسم الثاني",
    'last name  must not be empty':"الاسم الثاني يجب ألا يكون فارغ",
    'Position Title':'المنصب الوظيفي',
    'position title must not be empty':"المنصب الوظيفي يجب ألا يكون فارغ",





    'Write a review': "اكتب تعليق",
    'Our application  is  meant to make your life easier \n here you can find all the exhibitions you want, visit them and participate in them \n also  you can add your own expo and manage it on the tip of your finger\n'
    'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope you enjoy it . ':
  "يهدف تطبيقنا إلى جعل حياتك أسهل \ n هنا يمكنك العثور على جميع المعارض التي تريدها وزيارتها والمشاركة فيها \ n كما يمكنك إضافة المعرض الخاص بك وإدارته بضغطة زر "
  "نحن مجموعة من طلاب السنة الثالثة في كلية تكنولوجيا المعلومات في جامعة دمشق وكان هذا مشروعنا هذا العام \ n نأمل أن تستمتع به. ",

    'way to meet, communicate,\n share and compete ':
        'طريقة للتقابل\n للتواصل \n المشاركة والمنافسة',
    'marketing for your work with\n the advantage of holding a\n conference to promote\n yourself .':
        'للتسويق لعملك  \n مع ميزة عقد  \n مؤتمر للترويج \n لنفسك',
    "Lana Halak": "لانا حلاق",
  };
  Map<String, String> textEn = {
    //menu
    'Settings': 'Settings',
    'english': 'english',
    'arabic': 'arabic',
    'About us': 'About us',
    'Logout': 'Logout',

    //profile
    'My Exhibition': 'My Exhibition',
    'My Booths': 'My Booths',
    //About_us
  'Our application  is  meant to make your life easier \n here you can find all the exhibitions you want, visit them and participate in them \n also  you can add your own expo and manage it on the tip of your finger\n'
  'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope you enjoy it . ':'Our application  is  meant to make your life easier \n here you can find all the exhibitions you want, visit them and participate in them \n also  you can add your own expo and manage it on the tip of your finger\n'
  'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope you enjoy it . ',
    //welcome
    " Bring your exhibition event\n management to the next level\n with us":
        " Bring your exhibition event\n management to the next level\n with us",
    "Get started": "Get started",
    //home page
    "Happening Now": "Happening Now",
    //sign up
    "Validated": "Validated",
    "Not validated": "Not validated",
    'Welcome': 'Welcome',
    'email': 'email',
    'username': 'username',
    'Password': 'Password',
    'confirm Password': 'confirm Password',
    "Submit": "Submit",
    //notification
    'NEWS': 'NEWS',

    //manage booth
    'company name': 'company name',
    'About': 'About',
    'Brochure': 'Brochure',
    'Products': 'Products',
    'Announcement': 'Announcement',
    'Reviews': 'Reviews',
    'About us': 'About us',
    'Edit email': 'Edit email',
    'OK': 'OK',
    'Cancel': 'Cancel',
    "phone": "phone",
    'Edit phoneNumber': 'Edit phoneNumber',
    'fax': 'fax',
    'Edit fax': 'Edit fax',
    'My Products': 'My Products',
    'Add a product': 'Add a product',
    ' Are you sure you want to delete this product?':
        ' Are you sure you want to delete this product?',
    'delete': 'delete',
    'Product name': 'Product name',
    'Product price': 'Product price',
    "add the product": "add the product",
    'Conferences': 'Conferences',
    'Sales': 'Sales',
    'no image was selected': 'no image was selected',
    'My Announcements': 'My Announcements',
    'Make Announcement': 'Make Announcement',
    'Add a sale': 'Add a sale',
    'Step 1': 'Step 1',
    'From': 'From',
    'To': 'To',
    'Discount ': 'Discount ',
    'Hold a conference': 'Hold a conference',
    'choose date': 'choose date',
    'Home': 'Home',
    'profile': 'profile',
    'other': 'other',
    "Visit": "Visit",
    "Invest": "Invest",
    "View Requests":"View Requests",
    'Choose booth':'Choose booth',
    'Time period':'Time period',
    "Apply":"Apply",
    'Step 2':'Step 2',
    'please enter the date':'please enter the date',

    'Syria':'Syria',
    'Lebanon':'Lebanon',
    'Sudan':'Sudan',
    'Russia':'Russia',
    'India':'India',
    'Armenia':'Armenia',
    'Belarus':'Belarus',
    'Brazil':'Brazil',
    'Egypt':'Egypt',
    'Iran':'Iran',
    'Jordan':'Jordan',
    'Oman':'Oman',
    'palestine':'palestine',
    'Pakistan':'Pakistan',
    'Qatar':'Qatar',
    'United-Arab-Emirates':'United-Arab-Emirates',
    'Philippines':'Philippines',
    'Sorry':'Sorry',
    'Personl informaiton':'Personl informaiton',
    'First name':'First name',
    'first name  must not be empty':'first name  must not be empty',
    'Last Name':'Last Name',
    'last name  must not be empty':'last name  must not be empty',
    'Position Title':'Position Title',
    'position title must not be empty':'position title must not be empty',




    'Write a review': 'Write a review',

    'Our application  is  meant to make your life easier \n here you can find all the exhibitions you want, visit them and participate in them \n also  you can add your own expo and manage it on the tip of your finger\n':
        'Our application  is  meant to make your life easier \n here you can find all the exhibitions you want, visit them and participate in them \n also  you can add your own expo and manage it on the tip of your finger\n',

    //login
    'way to meet, communicate,\n share and compete ':
        'way to meet, communicate,\n share and compete ',
    'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope you enjoy it . ':
        'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope you enjoy it .'
            'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope you enjoy it . ',
    "Lana Halak": "Lana Halak",
  };

  changeLan(bool lan) async {
    isLoading = true;
    notifyListeners();
    isEn = lan;
    notifyListeners();
    isLoading = false;
    notifyListeners();
    print(isEn);
  }

  String? getTexts(String txt) {
    if (isEn == true) return textEn[txt];
    return textAr[txt];
  }
}
