import 'package:flutter/material.dart';
import 'package:mgramseva/model/localization/language.dart';
import 'package:mgramseva/routers/routers.dart';
import 'package:mgramseva/utils/constants/i18_key_constants.dart';
import 'package:mgramseva/utils/localization/application_localizations.dart';
import 'package:mgramseva/utils/testing_keys/testing_keys.dart';
import 'package:mgramseva/widgets/background_container.dart';
import 'package:mgramseva/widgets/button.dart';
import 'package:mgramseva/widgets/language_card.dart';
import 'package:mgramseva/widgets/footer_banner.dart';

class LanguageSelectionDesktopView extends StatelessWidget {
  final StateInfo stateInfo;
  final Function changeLanguage;
  LanguageSelectionDesktopView(this.stateInfo, this.changeLanguage);

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: new Container(
                height: 256,
                width: 500,
                padding: EdgeInsets.all(16),
                child: Card(
                    child: (Column(children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              width: 150,
                              image: NetworkImage(
                                stateInfo.logoUrl!,
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " | ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  textAlign: TextAlign.left,
                                ),
                              ))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ApplicationLocalizations.of(context)
                                      .translate(stateInfo.code!),
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  textAlign: TextAlign.left,
                                ),
                              )))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var language in stateInfo.languages ?? [])
                              LanguageCard(language, stateInfo.languages ?? [],
                                  120, 10, 10)
                          ])),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Button(i18.common.CONTINUE,
                          () => Navigator.pushNamed(context, Routes.LOGIN),
                          key: Keys.language.LANGUAGE_PAGE_CONTINUE_BTN)),
                  SizedBox(
                    height: 10,
                  )
                ]))))),
        FooterBanner()
      ],
    ));
  }
}
