// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Keep your car always ready`
  String get onboarding_title_1 {
    return Intl.message(
      'Keep your car always ready',
      name: 'onboarding_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Track maintenance schedules and make sure your car is always performing at its best.`
  String get onboarding_subtitle_1 {
    return Intl.message(
      'Track maintenance schedules and make sure your car is always performing at its best.',
      name: 'onboarding_subtitle_1',
      desc: '',
      args: [],
    );
  }

  /// `Know every detail about your car instantly`
  String get onboarding_title_2 {
    return Intl.message(
      'Know every detail about your car instantly',
      name: 'onboarding_title_2',
      desc: '',
      args: [],
    );
  }

  /// `View mileage, oil type, and car status easily at any time.`
  String get onboarding_subtitle_2 {
    return Intl.message(
      'View mileage, oil type, and car status easily at any time.',
      name: 'onboarding_subtitle_2',
      desc: '',
      args: [],
    );
  }

  /// `Smart reminders and exclusive offers`
  String get onboarding_title_3 {
    return Intl.message(
      'Smart reminders and exclusive offers',
      name: 'onboarding_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Receive alerts before oil change dates and benefit from special loyalty offers.`
  String get onboarding_subtitle_3 {
    return Intl.message(
      'Receive alerts before oil change dates and benefit from special loyalty offers.',
      name: 'onboarding_subtitle_3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Zabtly`
  String get brandName {
    return Intl.message('Zabtly', name: 'brandName', desc: '', args: []);
  }

  /// `Ready to start your journey with Qodra? Stay informed about every detail of your car.`
  String get welcome_subtitle {
    return Intl.message(
      'Ready to start your journey with Qodra? Stay informed about every detail of your car.',
      name: 'welcome_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose the language to continue`
  String get choose_language {
    return Intl.message(
      'Choose the language to continue',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get language_ar {
    return Intl.message('Arabic', name: 'language_ar', desc: '', args: []);
  }

  /// `English`
  String get language_en {
    return Intl.message('English', name: 'language_en', desc: '', args: []);
  }

  /// `Continue`
  String get continue_button {
    return Intl.message(
      'Continue',
      name: 'continue_button',
      desc: '',
      args: [],
    );
  }

  /// `Please select a language first`
  String get errorlangselect {
    return Intl.message(
      'Please select a language first',
      name: 'errorlangselect',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Login`
  String get AppBarLogin {
    return Intl.message('Login', name: 'AppBarLogin', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Forgot your password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Don’t have an account? `
  String get noAccountTitle {
    return Intl.message(
      'Don’t have an account? ',
      name: 'noAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact the workshop to register you in the system`
  String get noAccountAction {
    return Intl.message(
      'Contact the workshop to register you in the system',
      name: 'noAccountAction',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to send a verification code`
  String get enterPhoneToSendCode {
    return Intl.message(
      'Enter your phone number to send a verification code',
      name: 'enterPhoneToSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message('Send Code', name: 'sendCode', desc: '', args: []);
  }

  /// `Enter the verification code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter the verification code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message('Enter Code', name: 'enterCode', desc: '', args: []);
  }

  /// `Re-Send Code`
  String get reenterCode {
    return Intl.message(
      'Re-Send Code',
      name: 'reenterCode',
      desc: '',
      args: [],
    );
  }

  /// `Press resend code after {seconds} seconds`
  String resendCodeAfter40Seconds(Object seconds) {
    return Intl.message(
      'Press resend code after $seconds seconds',
      name: 'resendCodeAfter40Seconds',
      desc: '',
      args: [seconds],
    );
  }

  /// `Please wait until the timer ends`
  String get waitUntilTimerEnds {
    return Intl.message(
      'Please wait until the timer ends',
      name: 'waitUntilTimerEnds',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Rules`
  String get passwordRules {
    return Intl.message(
      'Password Rules',
      name: 'passwordRules',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get atLeast8Characters {
    return Intl.message(
      'At least 8 characters',
      name: 'atLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `At least one uppercase letter`
  String get atLeastOneUppercase {
    return Intl.message(
      'At least one uppercase letter',
      name: 'atLeastOneUppercase',
      desc: '',
      args: [],
    );
  }

  /// `At least one number`
  String get atLeastOneNumber {
    return Intl.message(
      'At least one number',
      name: 'atLeastOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `At least one special character`
  String get atLeastOneSpecialCharacter {
    return Intl.message(
      'At least one special character',
      name: 'atLeastOneSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Confirm verification code`
  String get confirm {
    return Intl.message(
      'Confirm verification code',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Smart Assistant`
  String get smartAssistant {
    return Intl.message(
      'Smart Assistant',
      name: 'smartAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Welcome {name}`
  String welcomeHomeAppBar(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'welcomeHomeAppBar',
      desc: '',
      args: [name],
    );
  }

  /// `Open Now`
  String get openNow {
    return Intl.message('Open Now', name: 'openNow', desc: '', args: []);
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Closed Now`
  String get closedNow {
    return Intl.message('Closed Now', name: 'closedNow', desc: '', args: []);
  }

  /// `Model`
  String get model {
    return Intl.message('Model', name: 'model', desc: '', args: []);
  }

  /// `Plate Number`
  String get plateNumber {
    return Intl.message(
      'Plate Number',
      name: 'plateNumber',
      desc: '',
      args: [],
    );
  }

  /// `Oil Status`
  String get oilStatus {
    return Intl.message('Oil Status', name: 'oilStatus', desc: '', args: []);
  }

  /// `Oil change due in {date}`
  String oilReminderDate(Object date) {
    return Intl.message(
      'Oil change due in $date',
      name: 'oilReminderDate',
      desc: '',
      args: [date],
    );
  }

  /// `Latest Services`
  String get LatestServices {
    return Intl.message(
      'Latest Services',
      name: 'LatestServices',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get ViewAll {
    return Intl.message('View All', name: 'ViewAll', desc: '', args: []);
  }

  /// `Normal`
  String get levelNormal {
    return Intl.message('Normal', name: 'levelNormal', desc: '', args: []);
  }

  /// `Bronze`
  String get levelBronze {
    return Intl.message('Bronze', name: 'levelBronze', desc: '', args: []);
  }

  /// `Silver`
  String get levelSilver {
    return Intl.message('Silver', name: 'levelSilver', desc: '', args: []);
  }

  /// `Gold`
  String get levelGold {
    return Intl.message('Gold', name: 'levelGold', desc: '', args: []);
  }

  /// `Platinum`
  String get levelPlatinum {
    return Intl.message('Platinum', name: 'levelPlatinum', desc: '', args: []);
  }

  /// `A strong start is always the most important step`
  String get levelNormalTxt {
    return Intl.message(
      'A strong start is always the most important step',
      name: 'levelNormalTxt',
      desc: '',
      args: [],
    );
  }

  /// `Every bronze step brings you closer to excellence`
  String get levelBronzeTxt {
    return Intl.message(
      'Every bronze step brings you closer to excellence',
      name: 'levelBronzeTxt',
      desc: '',
      args: [],
    );
  }

  /// `Keep going silver, success is on the way`
  String get levelSilverTxt {
    return Intl.message(
      'Keep going silver, success is on the way',
      name: 'levelSilverTxt',
      desc: '',
      args: [],
    );
  }

  /// `Gold requires effort and challenge`
  String get levelGoldTxt {
    return Intl.message(
      'Gold requires effort and challenge',
      name: 'levelGoldTxt',
      desc: '',
      args: [],
    );
  }

  /// `The peak belongs to those who pursue with determination`
  String get levelPlatinumTxt {
    return Intl.message(
      'The peak belongs to those who pursue with determination',
      name: 'levelPlatinumTxt',
      desc: '',
      args: [],
    );
  }

  /// `Start with one small step today-your car will thank you tomorrow.`
  String get motivationalMessage_001 {
    return Intl.message(
      'Start with one small step today-your car will thank you tomorrow.',
      name: 'motivationalMessage_001',
      desc: '',
      args: [],
    );
  }

  /// `A quick check now is better than a big repair later.`
  String get motivationalMessage_002 {
    return Intl.message(
      'A quick check now is better than a big repair later.',
      name: 'motivationalMessage_002',
      desc: '',
      args: [],
    );
  }

  /// `Stick to maintenance dates-peace of mind is worth it.`
  String get motivationalMessage_003 {
    return Intl.message(
      'Stick to maintenance dates-peace of mind is worth it.',
      name: 'motivationalMessage_003',
      desc: '',
      args: [],
    );
  }

  /// `Small follow-ups today save time and money tomorrow.`
  String get motivationalMessage_004 {
    return Intl.message(
      'Small follow-ups today save time and money tomorrow.',
      name: 'motivationalMessage_004',
      desc: '',
      args: [],
    );
  }

  /// `Every service visit keeps your car performing better.`
  String get motivationalMessage_005 {
    return Intl.message(
      'Every service visit keeps your car performing better.',
      name: 'motivationalMessage_005',
      desc: '',
      args: [],
    );
  }

  /// `Keep your car ready for your next trip.`
  String get motivationalMessage_006 {
    return Intl.message(
      'Keep your car ready for your next trip.',
      name: 'motivationalMessage_006',
      desc: '',
      args: [],
    );
  }

  /// `You decide your car's lifespan-stay consistent.`
  String get motivationalMessage_007 {
    return Intl.message(
      'You decide your car\'s lifespan-stay consistent.',
      name: 'motivationalMessage_007',
      desc: '',
      args: [],
    );
  }

  /// `Regular care protects your car's resale value.`
  String get motivationalMessage_008 {
    return Intl.message(
      'Regular care protects your car\'s resale value.',
      name: 'motivationalMessage_008',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance isn't a luxury-it's safety for you and your passengers.`
  String get motivationalMessage_009 {
    return Intl.message(
      'Maintenance isn\'t a luxury-it\'s safety for you and your passengers.',
      name: 'motivationalMessage_009',
      desc: '',
      args: [],
    );
  }

  /// `Make maintenance a habit, not a reaction to breakdowns.`
  String get motivationalMessage_010 {
    return Intl.message(
      'Make maintenance a habit, not a reaction to breakdowns.',
      name: 'motivationalMessage_010',
      desc: '',
      args: [],
    );
  }

  /// `Today's checkup = tomorrow's savings.`
  String get motivationalMessage_011 {
    return Intl.message(
      'Today\'s checkup = tomorrow\'s savings.',
      name: 'motivationalMessage_011',
      desc: '',
      args: [],
    );
  }

  /// `Your car serves you daily-return the favor on time.`
  String get motivationalMessage_012 {
    return Intl.message(
      'Your car serves you daily-return the favor on time.',
      name: 'motivationalMessage_012',
      desc: '',
      args: [],
    );
  }

  /// `Keep going-logging services prevents road surprises.`
  String get motivationalMessage_013 {
    return Intl.message(
      'Keep going-logging services prevents road surprises.',
      name: 'motivationalMessage_013',
      desc: '',
      args: [],
    );
  }

  /// `A small reminder can prevent a big problem.`
  String get motivationalMessage_014 {
    return Intl.message(
      'A small reminder can prevent a big problem.',
      name: 'motivationalMessage_014',
      desc: '',
      args: [],
    );
  }

  /// `Take a minute and review your car's status.`
  String get motivationalMessage_015 {
    return Intl.message(
      'Take a minute and review your car\'s status.',
      name: 'motivationalMessage_015',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance is an investment, not a cost.`
  String get motivationalMessage_016 {
    return Intl.message(
      'Maintenance is an investment, not a cost.',
      name: 'motivationalMessage_016',
      desc: '',
      args: [],
    );
  }

  /// `Consistency wins-safer drives and fewer headaches.`
  String get motivationalMessage_017 {
    return Intl.message(
      'Consistency wins-safer drives and fewer headaches.',
      name: 'motivationalMessage_017',
      desc: '',
      args: [],
    );
  }

  /// `On-time service extends your car's life.`
  String get motivationalMessage_018 {
    return Intl.message(
      'On-time service extends your car\'s life.',
      name: 'motivationalMessage_018',
      desc: '',
      args: [],
    );
  }

  /// `Stay one step ahead of issues.`
  String get motivationalMessage_019 {
    return Intl.message(
      'Stay one step ahead of issues.',
      name: 'motivationalMessage_019',
      desc: '',
      args: [],
    );
  }

  /// `A quick review today avoids downtime tomorrow.`
  String get motivationalMessage_020 {
    return Intl.message(
      'A quick review today avoids downtime tomorrow.',
      name: 'motivationalMessage_020',
      desc: '',
      args: [],
    );
  }

  /// `Track your services and drive with confidence.`
  String get motivationalMessage_021 {
    return Intl.message(
      'Track your services and drive with confidence.',
      name: 'motivationalMessage_021',
      desc: '',
      args: [],
    );
  }

  /// `An organized service history makes decisions easier.`
  String get motivationalMessage_022 {
    return Intl.message(
      'An organized service history makes decisions easier.',
      name: 'motivationalMessage_022',
      desc: '',
      args: [],
    );
  }

  /// `Road safety starts with solid maintenance.`
  String get motivationalMessage_023 {
    return Intl.message(
      'Road safety starts with solid maintenance.',
      name: 'motivationalMessage_023',
      desc: '',
      args: [],
    );
  }

  /// `Small win: update your car details today.`
  String get motivationalMessage_024 {
    return Intl.message(
      'Small win: update your car details today.',
      name: 'motivationalMessage_024',
      desc: '',
      args: [],
    );
  }

  /// `One on-time visit can make a big difference.`
  String get motivationalMessage_025 {
    return Intl.message(
      'One on-time visit can make a big difference.',
      name: 'motivationalMessage_025',
      desc: '',
      args: [],
    );
  }

  /// `Progress is progress-even a simple maintenance step.`
  String get motivationalMessage_026 {
    return Intl.message(
      'Progress is progress-even a simple maintenance step.',
      name: 'motivationalMessage_026',
      desc: '',
      args: [],
    );
  }

  /// `Drive with confidence-routine care means stress-free trips.`
  String get motivationalMessage_027 {
    return Intl.message(
      'Drive with confidence-routine care means stress-free trips.',
      name: 'motivationalMessage_027',
      desc: '',
      args: [],
    );
  }

  /// `Your future on the road starts with care today.`
  String get motivationalMessage_028 {
    return Intl.message(
      'Your future on the road starts with care today.',
      name: 'motivationalMessage_028',
      desc: '',
      args: [],
    );
  }

  /// `Consistency today prevents problems tomorrow.`
  String get motivationalMessage_029 {
    return Intl.message(
      'Consistency today prevents problems tomorrow.',
      name: 'motivationalMessage_029',
      desc: '',
      args: [],
    );
  }

  /// `Your car deserves care-and you've got this.`
  String get motivationalMessage_030 {
    return Intl.message(
      'Your car deserves care-and you\'ve got this.',
      name: 'motivationalMessage_030',
      desc: '',
      args: [],
    );
  }

  /// `Documented services = more accurate health checks.`
  String get motivationalMessage_031 {
    return Intl.message(
      'Documented services = more accurate health checks.',
      name: 'motivationalMessage_031',
      desc: '',
      args: [],
    );
  }

  /// `Small details prevent big issues.`
  String get motivationalMessage_032 {
    return Intl.message(
      'Small details prevent big issues.',
      name: 'motivationalMessage_032',
      desc: '',
      args: [],
    );
  }

  /// `Make maintenance a priority and stay worry-free.`
  String get motivationalMessage_033 {
    return Intl.message(
      'Make maintenance a priority and stay worry-free.',
      name: 'motivationalMessage_033',
      desc: '',
      args: [],
    );
  }

  /// `Today's step: review your last service.`
  String get motivationalMessage_034 {
    return Intl.message(
      'Today\'s step: review your last service.',
      name: 'motivationalMessage_034',
      desc: '',
      args: [],
    );
  }

  /// `Oil checks on time = smoother performance and longer life.`
  String get motivationalMessage_035 {
    return Intl.message(
      'Oil checks on time = smoother performance and longer life.',
      name: 'motivationalMessage_035',
      desc: '',
      args: [],
    );
  }

  /// `Filter changes on schedule protect your engine.`
  String get motivationalMessage_036 {
    return Intl.message(
      'Filter changes on schedule protect your engine.',
      name: 'motivationalMessage_036',
      desc: '',
      args: [],
    );
  }

  /// `One correct detail can change the right maintenance decision.`
  String get motivationalMessage_037 {
    return Intl.message(
      'One correct detail can change the right maintenance decision.',
      name: 'motivationalMessage_037',
      desc: '',
      args: [],
    );
  }

  /// `Stay consistent-your car stays with you longer.`
  String get motivationalMessage_038 {
    return Intl.message(
      'Stay consistent-your car stays with you longer.',
      name: 'motivationalMessage_038',
      desc: '',
      args: [],
    );
  }

  /// `Don't wait for warning lights-stay proactive.`
  String get motivationalMessage_039 {
    return Intl.message(
      'Don\'t wait for warning lights-stay proactive.',
      name: 'motivationalMessage_039',
      desc: '',
      args: [],
    );
  }

  /// `Every time you open the app, you're one step smarter.`
  String get motivationalMessage_040 {
    return Intl.message(
      'Every time you open the app, you\'re one step smarter.',
      name: 'motivationalMessage_040',
      desc: '',
      args: [],
    );
  }

  /// `Long roads need regular maintenance.`
  String get motivationalMessage_041 {
    return Intl.message(
      'Long roads need regular maintenance.',
      name: 'motivationalMessage_041',
      desc: '',
      args: [],
    );
  }

  /// `Before traveling, do a quick service check.`
  String get motivationalMessage_042 {
    return Intl.message(
      'Before traveling, do a quick service check.',
      name: 'motivationalMessage_042',
      desc: '',
      args: [],
    );
  }

  /// `Peace of mind on the road starts here.`
  String get motivationalMessage_043 {
    return Intl.message(
      'Peace of mind on the road starts here.',
      name: 'motivationalMessage_043',
      desc: '',
      args: [],
    );
  }

  /// `Today's reminder: check tire pressure.`
  String get motivationalMessage_044 {
    return Intl.message(
      'Today\'s reminder: check tire pressure.',
      name: 'motivationalMessage_044',
      desc: '',
      args: [],
    );
  }

  /// `Check your brakes-safety first.`
  String get motivationalMessage_045 {
    return Intl.message(
      'Check your brakes-safety first.',
      name: 'motivationalMessage_045',
      desc: '',
      args: [],
    );
  }

  /// `Prevention is better than repair.`
  String get motivationalMessage_046 {
    return Intl.message(
      'Prevention is better than repair.',
      name: 'motivationalMessage_046',
      desc: '',
      args: [],
    );
  }

  /// `A small effort now avoids big stress later.`
  String get motivationalMessage_047 {
    return Intl.message(
      'A small effort now avoids big stress later.',
      name: 'motivationalMessage_047',
      desc: '',
      args: [],
    );
  }

  /// `Updating your service log makes tracking easier.`
  String get motivationalMessage_048 {
    return Intl.message(
      'Updating your service log makes tracking easier.',
      name: 'motivationalMessage_048',
      desc: '',
      args: [],
    );
  }

  /// `New day, new chance to care for your car.`
  String get motivationalMessage_049 {
    return Intl.message(
      'New day, new chance to care for your car.',
      name: 'motivationalMessage_049',
      desc: '',
      args: [],
    );
  }

  /// `Consistency is the secret-steady maintenance, steady driving.`
  String get motivationalMessage_050 {
    return Intl.message(
      'Consistency is the secret-steady maintenance, steady driving.',
      name: 'motivationalMessage_050',
      desc: '',
      args: [],
    );
  }

  /// `Number of visits {num}`
  String visitCount(Object num) {
    return Intl.message(
      'Number of visits $num',
      name: 'visitCount',
      desc: '',
      args: [num],
    );
  }

  /// `Workshop Details`
  String get workshopDetails {
    return Intl.message(
      'Workshop Details',
      name: 'workshopDetails',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message('WhatsApp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Working Hours`
  String get workingHours {
    return Intl.message(
      'Working Hours',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Available Services`
  String get availableServices {
    return Intl.message(
      'Available Services',
      name: 'availableServices',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Car Details`
  String get CarDetailsScreenTitle {
    return Intl.message(
      'Car Details',
      name: 'CarDetailsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Kilometers`
  String get currentKilometers {
    return Intl.message(
      'Current Kilometers',
      name: 'currentKilometers',
      desc: '',
      args: [],
    );
  }

  /// `Oil Type`
  String get oilType {
    return Intl.message('Oil Type', name: 'oilType', desc: '', args: []);
  }

  /// `Last Oil Change`
  String get lastOilChange {
    return Intl.message(
      'Last Oil Change',
      name: 'lastOilChange',
      desc: '',
      args: [],
    );
  }

  /// `Next Change After`
  String get nextChangeAfter {
    return Intl.message(
      'Next Change After',
      name: 'nextChangeAfter',
      desc: '',
      args: [],
    );
  }

  /// `View Maintenance History`
  String get viewMaintenanceHistory {
    return Intl.message(
      'View Maintenance History',
      name: 'viewMaintenanceHistory',
      desc: '',
      args: [],
    );
  }

  /// `Service History`
  String get ServiceHistory {
    return Intl.message(
      'Service History',
      name: 'ServiceHistory',
      desc: '',
      args: [],
    );
  }

  /// `Visit Number {num}`
  String visitNumber(Object num) {
    return Intl.message(
      'Visit Number $num',
      name: 'visitNumber',
      desc: '',
      args: [num],
    );
  }

  /// `Used Oil`
  String get usedOil {
    return Intl.message('Used Oil', name: 'usedOil', desc: '', args: []);
  }

  /// `Kilometers Count`
  String get kilometersCount {
    return Intl.message(
      'Kilometers Count',
      name: 'kilometersCount',
      desc: '',
      args: [],
    );
  }

  /// ` EGP`
  String get EGP {
    return Intl.message(' EGP', name: 'EGP', desc: '', args: []);
  }

  /// `Tips`
  String get tips {
    return Intl.message('Tips', name: 'tips', desc: '', args: []);
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Alerts`
  String get alerts {
    return Intl.message('Alerts', name: 'alerts', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Notification Settings`
  String get NotificationSettings {
    return Intl.message(
      'Notification Settings',
      name: 'NotificationSettings',
      desc: '',
      args: [],
    );
  }

  /// `App Notifications`
  String get app_notifications {
    return Intl.message(
      'App Notifications',
      name: 'app_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Reminders`
  String get notification_sound {
    return Intl.message(
      'Maintenance Reminders',
      name: 'notification_sound',
      desc: '',
      args: [],
    );
  }

  /// `Notifications reminding you of oil change appointments`
  String get maintenance_reminder_desc {
    return Intl.message(
      'Notifications reminding you of oil change appointments',
      name: 'maintenance_reminder_desc',
      desc: '',
      args: [],
    );
  }

  /// `Special Offers & Discounts`
  String get special_offers {
    return Intl.message(
      'Special Offers & Discounts',
      name: 'special_offers',
      desc: '',
      args: [],
    );
  }

  /// `Notifications about special offers`
  String get special_offers_desc {
    return Intl.message(
      'Notifications about special offers',
      name: 'special_offers_desc',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support Center`
  String get helpSupportCenterTitle {
    return Intl.message(
      'Help & Support Center',
      name: 'helpSupportCenterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tell us your complaint, suggestion, or service issue and we'll open WhatsApp with your message ready.`
  String get helpSupportCenterSubtitle {
    return Intl.message(
      'Tell us your complaint, suggestion, or service issue and we\'ll open WhatsApp with your message ready.',
      name: 'helpSupportCenterSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Complaint`
  String get supportTypeComplaintTitle {
    return Intl.message(
      'Complaint',
      name: 'supportTypeComplaintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Report a bad experience`
  String get supportTypeComplaintDesc {
    return Intl.message(
      'Report a bad experience',
      name: 'supportTypeComplaintDesc',
      desc: '',
      args: [],
    );
  }

  /// `Suggestion`
  String get supportTypeSuggestionTitle {
    return Intl.message(
      'Suggestion',
      name: 'supportTypeSuggestionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share an improvement idea`
  String get supportTypeSuggestionDesc {
    return Intl.message(
      'Share an improvement idea',
      name: 'supportTypeSuggestionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Service Issue`
  String get supportTypeServiceIssueTitle {
    return Intl.message(
      'Service Issue',
      name: 'supportTypeServiceIssueTitle',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem in service`
  String get supportTypeServiceIssueDesc {
    return Intl.message(
      'Report a problem in service',
      name: 'supportTypeServiceIssueDesc',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get supportTypeContactTitle {
    return Intl.message(
      'Contact Support',
      name: 'supportTypeContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `General help and follow-up`
  String get supportTypeContactDesc {
    return Intl.message(
      'General help and follow-up',
      name: 'supportTypeContactDesc',
      desc: '',
      args: [],
    );
  }

  /// `Request type`
  String get supportRequestTypeLabel {
    return Intl.message(
      'Request type',
      name: 'supportRequestTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get supportMessageLabel {
    return Intl.message(
      'Message',
      name: 'supportMessageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Write your message here...`
  String get supportMessagePlaceholder {
    return Intl.message(
      'Write your message here...',
      name: 'supportMessagePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `This opens WhatsApp so you can complete sending.`
  String get supportComposerHint {
    return Intl.message(
      'This opens WhatsApp so you can complete sending.',
      name: 'supportComposerHint',
      desc: '',
      args: [],
    );
  }

  /// `Send via WhatsApp`
  String get supportSendButton {
    return Intl.message(
      'Send via WhatsApp',
      name: 'supportSendButton',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp opened. Your message is ready to send.`
  String get supportLaunchSuccess {
    return Intl.message(
      'WhatsApp opened. Your message is ready to send.',
      name: 'supportLaunchSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't open WhatsApp. Please try again.`
  String get supportLaunchFailure {
    return Intl.message(
      'Couldn\'t open WhatsApp. Please try again.',
      name: 'supportLaunchFailure',
      desc: '',
      args: [],
    );
  }

  /// `Please write your message first.`
  String get supportEmptyMessageError {
    return Intl.message(
      'Please write your message first.',
      name: 'supportEmptyMessageError',
      desc: '',
      args: [],
    );
  }

  /// `Hello, I am a Zabtly app user`
  String get supportTemplateGreeting {
    return Intl.message(
      'Hello, I am a Zabtly app user',
      name: 'supportTemplateGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Message prepared successfully.`
  String get supportPreparedState {
    return Intl.message(
      'Message prepared successfully.',
      name: 'supportPreparedState',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message('News', name: 'news', desc: '', args: []);
  }

  /// `Receive daily news`
  String get news_desc {
    return Intl.message(
      'Receive daily news',
      name: 'news_desc',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Workshop Transfer`
  String get workshop_transfer {
    return Intl.message(
      'Workshop Transfer',
      name: 'workshop_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `App Version {version}`
  String app_version(Object version) {
    return Intl.message(
      'App Version $version',
      name: 'app_version',
      desc: '',
      args: [version],
    );
  }

  /// `All rights reserved © Power 2025`
  String get all_rights_reserved {
    return Intl.message(
      'All rights reserved © Power 2025',
      name: 'all_rights_reserved',
      desc: '',
      args: [],
    );
  }

  /// `Workshop Transfer`
  String get workshop_transfer_title {
    return Intl.message(
      'Workshop Transfer',
      name: 'workshop_transfer_title',
      desc: '',
      args: [],
    );
  }

  /// `Requesting a workshop transfer allows you to choose a different workshop to continue maintenance and services for your vehicle.`
  String get workshop_transfer_desc {
    return Intl.message(
      'Requesting a workshop transfer allows you to choose a different workshop to continue maintenance and services for your vehicle.',
      name: 'workshop_transfer_desc',
      desc: '',
      args: [],
    );
  }

  /// `Transfer from workshop`
  String get from_workshop {
    return Intl.message(
      'Transfer from workshop',
      name: 'from_workshop',
      desc: '',
      args: [],
    );
  }

  /// `Current workshop`
  String get currentWorkshopLabel {
    return Intl.message(
      'Current workshop',
      name: 'currentWorkshopLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter source workshop code`
  String get transferFromCodePlaceholder {
    return Intl.message(
      'Enter source workshop code',
      name: 'transferFromCodePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter destination workshop code`
  String get transferToCodePlaceholder {
    return Intl.message(
      'Enter destination workshop code',
      name: 'transferToCodePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Transfer reason`
  String get transferReasonLabel {
    return Intl.message(
      'Transfer reason',
      name: 'transferReasonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter source workshop code`
  String get transferValidationFromCodeRequired {
    return Intl.message(
      'Please enter source workshop code',
      name: 'transferValidationFromCodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter destination workshop code`
  String get transferValidationToCodeRequired {
    return Intl.message(
      'Please enter destination workshop code',
      name: 'transferValidationToCodeRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter transfer reason`
  String get transferValidationReasonRequired {
    return Intl.message(
      'Please enter transfer reason',
      name: 'transferValidationReasonRequired',
      desc: '',
      args: [],
    );
  }

  /// `Oops, there was an error, please try again`
  String get genericServerError {
    return Intl.message(
      'Oops, there was an error, please try again',
      name: 'genericServerError',
      desc: '',
      args: [],
    );
  }

  /// `To workshop`
  String get to_workshop {
    return Intl.message('To workshop', name: 'to_workshop', desc: '', args: []);
  }

  /// `Enter the code of the workshop you want to transfer to`
  String get search_workshop_placeholder {
    return Intl.message(
      'Enter the code of the workshop you want to transfer to',
      name: 'search_workshop_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter the reason for the transfer request...`
  String get reason_placeholder {
    return Intl.message(
      'Enter the reason for the transfer request...',
      name: 'reason_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get transfer_button {
    return Intl.message(
      'Submit Request',
      name: 'transfer_button',
      desc: '',
      args: [],
    );
  }

  /// `The request is under review\nYou will be notified once the request is processed. This may take 24 to 48 hours.`
  String get order_review_message {
    return Intl.message(
      'The request is under review\nYou will be notified once the request is processed. This may take 24 to 48 hours.',
      name: 'order_review_message',
      desc: '',
      args: [],
    );
  }

  /// `Transfer From`
  String get transfer_from {
    return Intl.message(
      'Transfer From',
      name: 'transfer_from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get transfer_to {
    return Intl.message('To', name: 'transfer_to', desc: '', args: []);
  }

  /// `Cancel Request`
  String get cancel_order {
    return Intl.message(
      'Cancel Request',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Contact Technical Support`
  String get contact_support {
    return Intl.message(
      'Contact Technical Support',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Your transfer request has been accepted successfully. All your data will be moved to the new workshop within 24 hours.`
  String get transfer_request_accepted {
    return Intl.message(
      'Your transfer request has been accepted successfully. All your data will be moved to the new workshop within 24 hours.',
      name: 'transfer_request_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Your transfer request has been rejected. For more details, contact the workshop.`
  String get transfer_request_rejected {
    return Intl.message(
      'Your transfer request has been rejected. For more details, contact the workshop.',
      name: 'transfer_request_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Resend Request`
  String get resend_request {
    return Intl.message(
      'Resend Request',
      name: 'resend_request',
      desc: '',
      args: [],
    );
  }

  /// `Warning ⚠️`
  String get warning {
    return Intl.message('Warning ⚠️', name: 'warning', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logout_confirm {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Success ✅`
  String get success_done {
    return Intl.message('Success ✅', name: 'success_done', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get password_changed {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get ok {
    return Intl.message('Done', name: 'ok', desc: '', args: []);
  }

  /// `Are you sure you want to transfer to another workshop?`
  String get transfer_warning {
    return Intl.message(
      'Are you sure you want to transfer to another workshop?',
      name: 'transfer_warning',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been sent successfully and you will be notified when processed`
  String get transfer_request_sent {
    return Intl.message(
      'Your request has been sent successfully and you will be notified when processed',
      name: 'transfer_request_sent',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the transfer request?`
  String get cancel_transfer_warning {
    return Intl.message(
      'Are you sure you want to cancel the transfer request?',
      name: 'cancel_transfer_warning',
      desc: '',
      args: [],
    );
  }

  /// `The transfer request has been successfully cancelled`
  String get transfer_cancelled_success {
    return Intl.message(
      'The transfer request has been successfully cancelled',
      name: 'transfer_cancelled_success',
      desc: '',
      args: [],
    );
  }

  /// `Type your question here...`
  String get input_placeholder {
    return Intl.message(
      'Type your question here...',
      name: 'input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! I’m your smart assistant, ready to answer all your important questions about your car and workshop services. Ask me about maintenance, appointments, or available offers, and I will reply instantly.`
  String get message {
    return Intl.message(
      'Welcome! I’m your smart assistant, ready to answer all your important questions about your car and workshop services. Ask me about maintenance, appointments, or available offers, and I will reply instantly.',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_success {
    return Intl.message(
      'Login successful',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect phone number or password`
  String get wrong_credentials {
    return Intl.message(
      'Incorrect phone number or password',
      name: 'wrong_credentials',
      desc: '',
      args: [],
    );
  }

  /// `This user is not registered, please contact the workshop`
  String get user_not_found {
    return Intl.message(
      'This user is not registered, please contact the workshop',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with API server`
  String get connection_timeout {
    return Intl.message(
      'Connection timeout with API server',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with API server`
  String get send_timeout {
    return Intl.message(
      'Send timeout with API server',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with API server`
  String get receive_timeout {
    return Intl.message(
      'Receive timeout with API server',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate with API server`
  String get bad_certificate {
    return Intl.message(
      'Bad certificate with API server',
      name: 'bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get bad_response {
    return Intl.message(
      'Invalid email or password',
      name: 'bad_response',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error, please try later`
  String get internal_server_error {
    return Intl.message(
      'Internal server error, please try later',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists`
  String get account_exists {
    return Intl.message(
      'Account already exists',
      name: 'account_exists',
      desc: '',
      args: [],
    );
  }

  /// `Request to API server was cancelled`
  String get request_cancelled {
    return Intl.message(
      'Request to API server was cancelled',
      name: 'request_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connection error, please try again`
  String get connection_error {
    return Intl.message(
      'Connection error, please try again',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get no_internet {
    return Intl.message(
      'No internet connection',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error, please try again`
  String get unexpected_error {
    return Intl.message(
      'Unexpected error, please try again',
      name: 'unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Oops, there was an error, please try again`
  String get general_server_error {
    return Intl.message(
      'Oops, there was an error, please try again',
      name: 'general_server_error',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get NoInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'NoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Km`
  String get Km {
    return Intl.message('Km', name: 'Km', desc: '', args: []);
  }

  /// `No data is currently available.`
  String get no_data_found {
    return Intl.message(
      'No data is currently available.',
      name: 'no_data_found',
      desc: '',
      args: [],
    );
  }

  /// `Please try again or contact support`
  String get try_again_later {
    return Intl.message(
      'Please try again or contact support',
      name: 'try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `cars`
  String get cars {
    return Intl.message('cars', name: 'cars', desc: '', args: []);
  }

  /// `Workshop`
  String get workshop {
    return Intl.message('Workshop', name: 'workshop', desc: '', args: []);
  }

  /// `Could not launch dialer`
  String get dialer {
    return Intl.message(
      'Could not launch dialer',
      name: 'dialer',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp is not installed on your device`
  String get download_whatsapp {
    return Intl.message(
      'WhatsApp is not installed on your device',
      name: 'download_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Your transfer request has been successfully accepted`
  String get transferAcceptedTxt {
    return Intl.message(
      'Your transfer request has been successfully accepted',
      name: 'transferAcceptedTxt',
      desc: '',
      args: [],
    );
  }

  /// `Invalid workshop code`
  String get invalidWorkshopTxt {
    return Intl.message(
      'Invalid workshop code',
      name: 'invalidWorkshopTxt',
      desc: '',
      args: [],
    );
  }

  /// `Unavailable`
  String get workshopNameUnavailable {
    return Intl.message(
      'Unavailable',
      name: 'workshopNameUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get Unknown {
    return Intl.message('Unknown', name: 'Unknown', desc: '', args: []);
  }

  /// `No maintenance records for this car`
  String get no_maintenance_records {
    return Intl.message(
      'No maintenance records for this car',
      name: 'no_maintenance_records',
      desc: '',
      args: [],
    );
  }

  /// `notes`
  String get notes {
    return Intl.message('notes', name: 'notes', desc: '', args: []);
  }

  /// `No notifications available`
  String get no_notifications_available {
    return Intl.message(
      'No notifications available',
      name: 'no_notifications_available',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection, please try again`
  String get no_internet_retry {
    return Intl.message(
      'No internet connection, please try again',
      name: 'no_internet_retry',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error_occurred {
    return Intl.message(
      'An error occurred',
      name: 'error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please try again`
  String get error_occurred_retry {
    return Intl.message(
      'An error occurred, please try again',
      name: 'error_occurred_retry',
      desc: '',
      args: [],
    );
  }

  /// `No notifications available, please try again`
  String get no_notifications_available_retry {
    return Intl.message(
      'No notifications available, please try again',
      name: 'no_notifications_available_retry',
      desc: '',
      args: [],
    );
  }

  /// `Code sent successfully, please check WhatsApp`
  String get otp_sent_success {
    return Intl.message(
      'Code sent successfully, please check WhatsApp',
      name: 'otp_sent_success',
      desc: '',
      args: [],
    );
  }

  /// `The number is not registered for the workshop`
  String get phone_not_registered {
    return Intl.message(
      'The number is not registered for the workshop',
      name: 'phone_not_registered',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP, please try again`
  String get invalid_otp {
    return Intl.message(
      'Invalid OTP, please try again',
      name: 'invalid_otp',
      desc: '',
      args: [],
    );
  }

  /// `OTP is correct, you can change your password`
  String get otp_correct {
    return Intl.message(
      'OTP is correct, you can change your password',
      name: 'otp_correct',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_reset {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_reset',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
