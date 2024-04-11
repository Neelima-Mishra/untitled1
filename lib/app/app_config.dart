enum Environment { dev, prod }

class ConstantEnvironment {
  static Map<String, dynamic>? config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        config = Config.dev;
        break;
      case Environment.prod:
        config = Config.prod;
        break;
    }
  }

  static get baseUrl {
    return config?[Config.baseURL];
  }

  static get androidApiKey => config?[Config.androidApiKey];

  static get androidAppId => config?[Config.androidAppId];

  static get messagingSenderId => config?[Config.messagingSenderId];

  static get storageBucket => config?[Config.storageBucket];

  static get projectId => config?[Config.projectId];

  static get iOSApiKey => config?[Config.iOSApiKey];

  static get iOSAppId => config?[Config.iOSAppId];

  static get iOSClientId => config?[Config.iOSClientId];

  static get iOSBundleId => config?[Config.iOSBundleId];
}

class Config {
  //todo Final BASE_URL DEV(STAGING) and PROD
  static const baseURL = "https://airguide.vitecdevelopment.com/api/";
  static const androidApiKey = "androidApiKey";
  static const androidAppId = "androidAppId";
  static const messagingSenderId = "messagingSenderId";
  static const projectId = "projectId";
  static const storageBucket = "storageBucket";
  static const iOSApiKey = "iOSApiKey";
  static const iOSAppId = "iOSAppId";
  static const iOSClientId = "iOSClientId";
  static const iOSBundleId = "iOSBundleId";

  static Map<String, dynamic> dev = {
    baseURL: "https://airguide.vitecdevelopment.com/api/",
    androidApiKey: "AIzaSyAnjQn6uUJ7LXOWC2swnxitFSaCZyIpP-c",
    androidAppId: "1:444837009594:android:dd62be0a737d71011d4a83",
    messagingSenderId: "444837009594",
    projectId: 'safeourtomorrow',
    storageBucket: 'safeourtomorrow.appspot.com',
    iOSApiKey: 'AIzaSyDXQacH_fiXzZeGBUtb-LXoYKgKjCyZqXY',
    iOSAppId: '1:444837009594:ios:1ba35f6da70ab0b71d4a83',
    iOSClientId:
        '444837009594-juk4i08lj6boaognnhp0duclpcdfhvrs.apps.googleusercontent.com',
    iOSBundleId: 'com.safeourtomorrow.dev',
  };

  static Map<String, dynamic> prod = {
    baseURL: "https://airguide.vitecdevelopment.com/api/",
    androidApiKey: "AIzaSyAnjQn6uUJ7LXOWC2swnxitFSaCZyIpP-c",
    androidAppId: "1:444837009594:android:b1a05d5208753a071d4a83",
    messagingSenderId: "444837009594",
    projectId: 'safeourtomorrow',
    storageBucket: 'safeourtomorrow.appspot.com',
    iOSApiKey: 'AIzaSyDXQacH_fiXzZeGBUtb-LXoYKgKjCyZqXY',
    iOSAppId: '1:444837009594:ios:3645d084825e40371d4a83',
    iOSClientId:
        '444837009594-sivho2l3lr9k2hnst8n7kvdor8muctko.apps.googleusercontent.com',
    iOSBundleId: 'com.safeourtomorrow',
  };
}
