// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './home_banner.dart';
import './story.dart';
import 'package:url_launcher/url_launcher.dart';
/// 轮播图组件  可以直接引入
class Pagination extends StatelessWidget {
  static final String routeName = '/material/page-selector';
  static final List<Icon> icons = <Icon>[
    const Icon(Icons.event, semanticLabel: 'Event'),
    const Icon(Icons.home, semanticLabel: 'Home'),
    const Icon(Icons.android, semanticLabel: 'Android'),
    const Icon(Icons.alarm, semanticLabel: 'Alarm'),
    const Icon(Icons.face, semanticLabel: 'Face'),
    const Icon(Icons.language, semanticLabel: 'Language'),
  ];

  final List<dynamic> arr = [
    {'image': 'https://imgsa.baidu.com/news/q%3D100/sign=b39a39d29622720e7dcee6fa4bca0a3a/5882b2b7d0a20cf48bc0626f78094b36acaf992a.jpg', 'type': 0, 'id': 9695909, 'url': 'https://www.zhihu.com/question/294145797/answer/551162834', 'title': '中国女足收获四国赛冠军！但王霜太累了，何时能歇歇？'},
    {'image': 'https://imgsa.baidu.com/news/q%3D100/sign=83fa0937dea20cf44090fadf46084b0c/48540923dd54564e48206a89bdde9c82d1584f3d.jpg', 'type': 0, 'id': 9695859, 'url': 'https://zhuanlan.zhihu.com/p/51696594', 'title': '郑州火车站加开40趟临时列车 应对清明假期返程高峰'},
    {'image': 'https://imgsa.baidu.com/news/q%3D100/sign=4f3875bd7ecf3bc7ee00c9ece101babd/83025aafa40f4bfbd3dc17e40d4f78f0f7361875.jpg', 'type': 0, 'id': 96956491409, 'url':'https://zhuanlan.zhihu.com/p/53497167','title': '凉山火灾复燃面积约7公顷 扑火人员已撤至安全地带'},
    {'image': 'https://imgsa.baidu.com/news/q%3D100/sign=887b43a4b699a9013d355f362d940a58/1b4c510fd9f9d72af7128fadda2a2834349bbb08.jpg', 'type': 0, 'id': 9695816, 'url': 'https://mp.weixin.qq.com/s?__biz=MzAwODY4OTk2Mg==&mid=2652048101&idx=1&sn=20296088e4bd8ca33c5c9991167d9f7d&chksm=808caaa0b7fb23b65c0e5806209f8d86da6732f3a00a70353f3606018339518b0a8656f14dc5&mpsshare=1&scene=2&srcid=0106SZapVysZdIS6Oc5AhNH6&from=timeline&ascene=2&devicetype=android-27&version=27000038&nettype=WIFI&abtest_cookie=BQABAAgACgALABMAFAAFAJ2GHgAjlx4AV5keAJuZHgCcmR4AAAA%3D&lang=zh_CN&pass_ticket=4K1%2FUpsxP4suPj2iubR17wbAP7r9LW9iYrPAC2dppTqv7j7JO5FWMXtcKeBRxueV&wx_header=1', 'title': '高雄飞往香港客机迫降 初步判断：机械故障并非鸟击'}
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _pageSelector(BuildContext context) {
    List<Widget> list = [];
    List<StoryModel> bannerStories = [];
    /// super.initState();
    arr.forEach((item) {
      bannerStories.add(StoryModel.fromJson(item));
    });


    if (arr.length > 0) {
      list.add(HomeBanner(bannerStories, (story) {
        _launchURL('${story.url}');
      }));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        key:Key('__header__'),
        //physics: AlwaysScrollableScrollPhysics(),
        //padding: EdgeInsets.only(),
        children: _pageSelector(context)
      );
  }
}
