import 'package:timeago/timeago.dart' as timeago;

/// Converts a DateTime to 'x time ago' format
String formatTimeAgo(DateTime dateTime, {String locale = 'en'}) {
  return timeago.format(dateTime, locale: locale);
}
