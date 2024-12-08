import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:student_attendance/utils/utils.dart';

/// show loading dialog with loading text
void showLoading(BuildContext context){
  showMessage(
    context: context,
    status: 3,
    content: "Loading",
  );
}

/// show message dialog
/// * [title]: show text at the top of dialog
/// * [content]: show text at the body of dialog (no need  to translate)
/// * [status]: show dialog as:
///   * [0]: error dialog
///   * [1]: success
///   * [2]: warning
///   * [3]: loading
///   * [4]: not found
/// * [barrierDismissible]: if true, close dialog when click outside of dialog, if status = 3 its value always true
Future showMessage({
  required BuildContext context,
  String title = "Information",
  required String content,
  int status = 0,
  bool barrierDismissible = true,
}) async {
  showCupertinoDialog(
    context: context,
    barrierDismissible: status == 3 ? false : barrierDismissible,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: status != 3 ? Text(title, style: Style.txt25Bold, textAlign: TextAlign.center,) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (){
            if(status == 0){
              return Lottie.asset("assets/lotties/error.json", width: 100, repeat: false,);
            } else if(status == 1){
              return Lottie.asset("assets/lotties/success.json", width: 100, repeat: false,);
            } else if(status == 2){
              return Lottie.asset("assets/lotties/warning.json", width: 100, repeat: false,);
            } else if(status == 3){
              return Lottie.asset("assets/lotties/loading.json", width: 100, repeat: false,);
            } else {
              return Lottie.asset("assets/lotties/not_found.json", width: 100, repeat: false,);
            }
          }(),
          const SizedBox(height: 10,),
          Text(content, style: Style.txt16Grey, textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          (){
            if(status != 3){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: primaryTextButton(
                      onPressed: () => context.pop(),
                      child: Text("Close", style: Style.txt16White,),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          }(),
        ],
      ),
    ),
  );
}

void showProgress(BuildContext context, {ProgressType type = ProgressType.upload}){
  // reset progress
  Singleton.instance.widgetRef?.read(Singleton.instance.totalSendReceiveProgress.notifier).state = 0;
  Singleton.instance.widgetRef?.read(Singleton.instance.totalProgress.notifier).state = 1;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Consumer(
        builder: (context, ref, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(type == ProgressType.upload ? "Uploading" : "Downloading", style: Style.txt20Bold, textAlign: TextAlign.center,),
                const SizedBox(height: 20,),
                TweenAnimationBuilder(
                  tween: Tween(begin: 0, end: ref.watch(Singleton.instance.totalSendReceiveProgress)/ref.watch(Singleton.instance.totalProgress)),
                  builder: (context, value, _) {
                    return CircularProgressIndicator(
                      value: value.toDouble(),
                      strokeCap: StrokeCap.round,
                      color: Style.primaryColor,
                      backgroundColor: Colors.grey[200],
                      strokeWidth: 5,
                    );
                  },
                  duration: const Duration(milliseconds: 500),
                ),
                const SizedBox(height: 20,),
                Text(NumberFormat("#0.00%").format(ref.watch(Singleton.instance.totalSendReceiveProgress)/ref.watch(Singleton.instance.totalProgress)), style: Style.txt16Grey, textAlign: TextAlign.center,),
              ],
            ),
          );
        }
      ),
    ),
  );
}

/// Show confirm dialog to get boolean result
/// * [title]: Text to show at the top of dialog (no need )
/// * [content]: Text to show at the body of dialog (need )
/// * [confirmText]: Confirm button text (no need )
/// * [isDangerous]: To show as dangerous dialog or normal
Future<bool> showConfirmDialog({
  required BuildContext context,
  String title = "Confirmation",
  String content = "Have you already checked?",
  String confirmText = "Yes",
  bool isDangerous = false,
}) async {
  bool re = await showCupertinoDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(child: Text(title, style: Style.txt25Bold,)),
      surfaceTintColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset("assets/lotties/question.json", width: 100, repeat: false,),
          const SizedBox(height: 10,),
          Text(content, style: Style.txt16, textAlign: TextAlign.center,),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          children: [
            Expanded(
              child: secondaryTextButton(
                onPressed: (){
                  context.pop(false);
                },
                child: Text("Cancel", style: Style.txt16PrimaryColor,),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: primaryTextButton(
                onPressed: (){
                  context.pop(true);
                },
                backgroundColor: isDangerous ? Colors.red : Style.primaryColor,
                child: Text(confirmText, style: Style.txt16White),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return re;
}

void showSnackBar({required BuildContext context, String title = "Information", required String content, ContentType? type, Function? onTap, Map<String, dynamic>? extra, SnackBarAction? action, bool withAction = false}){
  type ??= ContentType.success;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: content,
      contentType: type,
    ),
  ));
}