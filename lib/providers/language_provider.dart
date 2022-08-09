import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  bool isEn=true;
  bool isLoading =false;

  Map<String,String> textAr={
    //menu
    'Settings':'إعدادات',
    'english':'الإنكليزية',
    'arabic':'العربية',
    'About us':'حولنا',
    'Logout':'تسجيل خروج',

    //profile
    'My Exhibition':'معارضي',
    'My Booths':'حجراتي',
    //welcome
    " Bring your exhibition event\n management to the next level\n with us":'احضر المعرض الخاص بك وقم بإدارته معنا',
    "Get started":'البدء',
    //home page
    "Happening Now":'يحدث الآن',
    //sign up
    "Validated":'تم التحقق من صحتها',
    "Not Validated":'لم يتم التحقق من صحتها',
    'Welcome':'مرحباً',
    'email':'البريد الإلكتروني',
    'username':'اسم المستخدم',
    'Password':'كلمة المرور',
    'confirm Password':'تأكيد كلمة المرور',
        "Submit":"تأكيد",
    //notification
    'NEWS':'الأخبار',

    //manage booth
    'company name':'اسم الشركة',
    'About':'حول',
    'Brochure':'بروشّور',
    'Products':'المنتجات',
    'Announcement':'إعلان',
    'Reviews':'التعليقات',
    'About us':'حولنا',
    'Edit email':'تعديل البريد الإلكتروني',
    'OK':'موافق',
    'Cancel':'إلغاء',
    "phone":'الرقم',
    'Edit phoneNumber':'تعديل الرقم',
    'fax':'فاكس',
    'Edit fax':'تعديل الفاكس',
    'My Products':'منتجاتي',
    'Add a product':'إضافة إلى النتجات',
    ' Are you sure you want to delete this product?':'هل أنت متأكد من حذف هذا المنتج',
    'delete':'حذف',
    'Product name':'اسم المنتج',
    'Product price':'سعر المنتج',
    "add the product":'إضافة إلى المنتجات',
    'Conferences':'المؤتمرات',
    'Sales':'التخفيضات',
    'way to meet, communicate,\n share and compete ':'طريقة للتقابل\n للتواصل \n المشاركة والمنافسة',
    'marketing for your work with\n the advantage of holding a\n conference to promote\n yourself .':'للتسويق لعملك  \n مع ميزة عقد  \n مؤتمر للترويج \n لنفسك',
    "Lana Halak":"لانا حلاق",




  };
  Map<String,String> textEn={
    //menu
    'Settings':'Settings',
    'english':'english',
    'arabic':'arabic',
    'About us':'About us',
    'Logout':'Logout',


     //profile
    'My Exhibition':'My Exhibition',
    'My Booths':'My Booths',
    //welcome
    " Bring your exhibition event\n management to the next level\n with us":" Bring your exhibition event\n management to the next level\n with us",
    "Get started":"Get started",
    //home page
    "Happening Now": "Happening Now",
    //sign up
    "Validated":"Validated",
    "Not validated":"Not validated",
    'Welcome':'Welcome',
    'email':'email',
    'username':'username',
    'Password':'Password',
    'confirm Password':'confirm Password',
    "Submit":"Submit",
    //notification
    'NEWS':'NEWS',

    //manage booth
    'company name':'company name',
    'About':'About',
    'Brochure':'Brochure',
    'Products':'Products',
    'Announcement':'Announcement',
    'Reviews':'Reviews',
    'About us':'About us',
    'Edit email':'Edit email',
    'OK':'OK',
    'Cancel':'Cancel',
    "phone":"phone",
    'Edit phoneNumber':'Edit phoneNumber',
    'fax':'fax',
    'Edit fax':'Edit fax',
    'My Products': 'My Products',
    'Add a product':'Add a product',
    ' Are you sure you want to delete this product?':' Are you sure you want to delete this product?',
    'delete':'delete',
    'Product name':'Product name',
    'Product price':'Product price',
    "add the product":"add the product",
    'Conferences':'Conferences',
    'Sales':'Sales',
    //login
    'way to meet, communicate,\n share and compete ':'way to meet, communicate,\n share and compete ',
    "Lana Halak":"Lana Halak",



};

  changeLan(bool lan)async{
    isLoading = true;
    notifyListeners();
    isEn=lan;
    notifyListeners();
    isLoading = false;
    notifyListeners();
    print(isEn);
  }

  String? getTexts(String txt){
    if(isEn==true) return textEn[txt];
    return textAr[txt];
  }



}