import 'package:booklyapp/core/utils/functions/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    !await launchUrl(uri);
  } else {
    customSnackBar(context, 'can not launch url = $url');
  }
}
}


