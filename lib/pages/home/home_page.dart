import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:zego_call/core/model/user_model.dart';
import 'package:zego_call/core/routers/routers.dart';
import 'package:zego_call/widgets/home/invite_id_form_field.dart';
import 'package:zego_call/widgets/home/send_call_button.dart';
import '../../service/login_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController singleInviteeUserIDTextCtrl =
      TextEditingController();
  final TextEditingController groupInviteeUserIDsTextCtrl =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(
            children: [
              Positioned(
                top: 20,
                right: 10,
                child: logoutButton(),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Text('Your Phone Number: ${currentUser.id}'),
              ),
              userListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Ink(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.redAccent,
      ),
      child: IconButton(
        icon: const Icon(Icons.exit_to_app_sharp),
        iconSize: 20,
        color: Colors.white,
        onPressed: () {
          logout().then((value) {
            onUserLogout();

            Navigator.pushNamed(
              context,
              PageRouteNames.login,
            );
          });
        },
      ),
    );
  }

  Widget userListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          late TextEditingController inviteeUsersIDTextCtrl;
          late List<Widget> userInfo;
          if (1 == index) {
            inviteeUsersIDTextCtrl = groupInviteeUserIDsTextCtrl;
            userInfo = [
              const Text('group name ('),
              InviteIDFormField(
                textCtrl: inviteeUsersIDTextCtrl,
                formatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                ],
                labelText: 'invitees ID',
                hintText: "separate IDs by ','",
              ),
              const Text(')'),
            ];
          } else {
            inviteeUsersIDTextCtrl = singleInviteeUserIDTextCtrl;
            userInfo = [
              const Text('invitee name ('),
              InviteIDFormField(
                textCtrl: inviteeUsersIDTextCtrl,
                formatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                ],
                labelText: 'invitee ID',
                hintText: 'plz enter invitee ID',
              ),
              const Text(')'),
            ];
          }

          return Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  ...userInfo,
                  Expanded(child: Container()),
                  SendCallButton(
                    isVideoCall: false,
                    inviteeUsersIDTextCtrl: inviteeUsersIDTextCtrl,
                    onCallFinished: onSendCallInvitationFinished,
                  ),
                  SendCallButton(
                    isVideoCall: true,
                    inviteeUsersIDTextCtrl: inviteeUsersIDTextCtrl,
                    onCallFinished: onSendCallInvitationFinished,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Divider(height: 1.0, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }

  void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    if (errorInvitees.isNotEmpty) {
      var userIDs = '';
      for (var index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        final userID = errorInvitees.elementAt(index);
        userIDs += '$userID ';
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = "User doesn't exist or is offline: $userIDs";
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      showToast(
        message,
        position: StyledToastPosition.top,
        context: context,
      );
    } else if (code.isNotEmpty) {
      showToast(
        'code: $code, message:$message',
        position: StyledToastPosition.top,
        context: context,
      );
    }
  }
}




