import 'package:qodraapp/core/utlis/formatEgyptWhatsApp.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppLaunchResult {
  const WhatsAppLaunchResult({
    required this.isSuccess,
    required this.usedFallback,
  });

  final bool isSuccess;
  final bool usedFallback;
}

class WhatsAppLauncherService {
  Future<WhatsAppLaunchResult> launchSupportMessage({
    required String phone,
    required String message,
  }) async {
    final formattedPhone = formatEgyptWhatsApp(phone);
    final encoded = Uri.encodeComponent(message);

    final appUri = Uri.parse(
      'whatsapp://send?phone=$formattedPhone&text=$encoded',
    );
    final fallbackUri =
        Uri.parse('https://wa.me/$formattedPhone?text=$encoded');

    if (await canLaunchUrl(appUri)) {
      final launched =
          await launchUrl(appUri, mode: LaunchMode.externalApplication);
      if (launched) {
        return const WhatsAppLaunchResult(isSuccess: true, usedFallback: false);
      }
    }

    final fallbackLaunched = await launchUrl(
      fallbackUri,
      mode: LaunchMode.externalApplication,
    );
    return WhatsAppLaunchResult(
      isSuccess: fallbackLaunched,
      usedFallback: true,
    );
  }
}
