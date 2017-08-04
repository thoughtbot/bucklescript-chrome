module Identity = struct
  (* chrome.identity.getAuthToken *)

  class type _accountInfo = object
    method id : string
  end [@bs]

  type accountInfo = _accountInfo Js.t
  external mkAccountInfo : ?id:string -> unit -> accountInfo = "" [@@bs.obj]

  class type _getAuthTokenOptions = object
    method interactive : Js.boolean
    method scopes : string list
    method account : accountInfo
  end [@bs]

  type getAuthTokenOptions = _getAuthTokenOptions Js.t
  external mkAuthOptions : ?interactive:Js.boolean -> ?scopes:string list -> ?account:accountInfo -> unit -> getAuthTokenOptions = "" [@@bs.obj]

  external getAuthToken : getAuthTokenOptions -> (string -> 'a) -> unit = "getAuthToken" [@@bs.scope "chrome", "identity"] [@@bs.val]

  (* chrome.identity.getProfileUserInfo *)

  class type _profileUserInfo = object
    method id : string
    method email : string
  end [@bs]

  type profileUserInfo = _profileUserInfo Js.t

  external getProfileUserInfo : (profileUserInfo -> 'a) -> unit = "getProfileUserInfo" [@@bs.scope "chrome", "identity"] [@@bs.val]

  (* chrome.identity.removeCachedAuthToken *)

  class type _rmCachedToken = object
    method token : string
  end [@bs]

  type rmCachedTokenOptions = _rmCachedToken Js.t
  external mkRmCachedTokenOptions : token:string -> unit -> rmCachedTokenOptions = "" [@@bs.obj]

  external removeCachedAuthToken : rmCachedTokenOptions -> (unit -> 'a) -> unit = "removeCachedAuthToken" [@@bs.scope "chrome", "identity"] [@@bs.val]

  (* chrome.identity.launchWebAuthFlow *)

  class type _webAuthFlowOptions = object
    method url : string
    method interactive : Js.boolean
  end [@bs]

  type webAuthFlowOptions = _webAuthFlowOptions Js.t
  external mkWebFlowOptions : url:string -> ?interactive:Js.boolean -> unit -> webAuthFlowOptions = "" [@@bs.obj]

  external launchWebAuthFlow : webAuthFlowOptions -> (string Js.null -> unit -> 'a) -> unit = "launchWebAuthFlow" [@@bs.scope "chrome", "identity"] [@@bs.val]

  (* chrome.identity.getRedirectURL *)

  external getRedirectURL : string Js.null -> string = "getRedirectURL" [@@bs.scope "chrome", "identity"] [@@bs.val]

  (* chrome.identity.onSignInChanged.addListener *)

  module OnSignInChanged = struct
    external addListener : (accountInfo -> Js.boolean -> 'a) -> unit = "addListener" [@@bs.scope "chrome", "identity", "onSignInChanged"] [@@bs.val]
  end
end
