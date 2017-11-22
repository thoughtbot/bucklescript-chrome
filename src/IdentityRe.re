/* chrome.identity.getAuthToken */
class type _accountInfo =
  [@bs]
  {
    pub id: string
  };

type accountInfo = Js.t(_accountInfo);

[@bs.obj] external mkAccountInfo : (~id: string=?, unit) => accountInfo = "";

class type _getAuthTokenOptions =
  [@bs]
  {
    pub interactive: Js.boolean;
    pub scopes: list(string);
    pub account: accountInfo
  };

type getAuthTokenOptions = Js.t(_getAuthTokenOptions);

[@bs.obj]
external mkAuthOptions :
  (~interactive: Js.boolean=?, ~scopes: list(string)=?, ~account: accountInfo=?, unit) =>
  getAuthTokenOptions =
  "";

[@bs.scope ("chrome", "identity")] [@bs.val]
external getAuthToken : (getAuthTokenOptions, string => 'a) => unit =
  "getAuthToken";

/* chrome.identity.getProfileUserInfo */
class type _profileUserInfo =
  [@bs]
  {
    pub id: string;
    pub email: string
  };

type profileUserInfo = Js.t(_profileUserInfo);

[@bs.scope ("chrome", "identity")] [@bs.val]
external getProfileUserInfo : (profileUserInfo => 'a) => unit =
  "getProfileUserInfo";

/* chrome.identity.removeCachedAuthToken */
class type _rmCachedToken =
  [@bs]
  {
    pub token: string
  };

type rmCachedTokenOptions = Js.t(_rmCachedToken);

[@bs.obj] external mkRmCachedTokenOptions : (~token: string, unit) => rmCachedTokenOptions = "";

[@bs.scope ("chrome", "identity")] [@bs.val]
external removeCachedAuthToken : (rmCachedTokenOptions, unit => 'a) => unit =
  "removeCachedAuthToken";

/* chrome.identity.launchWebAuthFlow */
class type _webAuthFlowOptions =
  [@bs]
  {
    pub url: string;
    pub interactive: Js.boolean
  };

type webAuthFlowOptions = Js.t(_webAuthFlowOptions);

[@bs.obj]
external mkWebFlowOptions : (~url: string, ~interactive: Js.boolean=?, unit) => webAuthFlowOptions =
  "";

[@bs.scope ("chrome", "identity")] [@bs.val]
external launchWebAuthFlow : (webAuthFlowOptions, (Js.null(string), unit) => 'a) => unit =
  "launchWebAuthFlow";

/* chrome.identity.getRedirectURL */
[@bs.scope ("chrome", "identity")] [@bs.val] external getRedirectURL : Js.null(string) => string =
  "getRedirectURL";

/* chrome.identity.onSignInChanged.addListener */
module OnSignInChanged = {
  [@bs.scope ("chrome", "identity", "onSignInChanged")] [@bs.val]
  external addListener : ((accountInfo, Js.boolean) => 'a) => unit =
    "addListener";
};