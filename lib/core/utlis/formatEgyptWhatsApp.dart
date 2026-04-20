String formatEgyptWhatsApp(String phone) {
  String p = phone.replaceAll(RegExp(r'[^0-9]'), '');

  if (p.startsWith('0')) {
    p = p.substring(1);
  }

  if (!p.startsWith('20')) {
    p = '20$p';
  }
  return p;
}
