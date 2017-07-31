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

external getAuthToken : getAuthTokenOptions -> (string -> unit) -> unit = "getAuthToken" [@@bs.scope "chrome", "identity"] [@@bs.val]

(* chrome.identity.getProfileUserInfo *)

class type _profileUserInfo = object
  method id : string
  method email : string
end [@bs]

type profileUserInfo = _profileUserInfo Js.t

external getProfileUserInfo : (profileUserInfo -> unit) -> unit = "getProfileUserInfo" [@@bs.scope "chrome", "identity"] [@@bs.val]

(* chrome.identity.removeCachedAuthToken *)

class type _rmCachedToken = object
  method token : string
end [@bs]

type rmCachedTokenOptions = _rmCachedToken Js.t
external mkRmCachedTokenOptions : token:string -> unit -> rmCachedTokenOptions = "" [@@bs.obj]

external removeCachedAuthToken : rmCachedTokenOptions -> (unit -> unit) -> unit = "removeCachedAuthToken" [@@bs.scope "chrome", "identity"] [@@bs.val]

type window
external window : window = "window" [@@bs.val]
external onload : window -> (unit -> unit) -> unit = "onload" [@@bs.set]
