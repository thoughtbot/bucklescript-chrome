class type _accountInfo = object
  method id : string
end [@bs]

type accountInfo = _accountInfo Js.t

class type _getAuthTokenOptions = object
  method interactive : Js.boolean
  method scopes : string list
  method account : accountInfo
end [@bs]

type getAuthTokenOptions = _getAuthTokenOptions Js.t

external getAuthToken : getAuthTokenOptions -> (string -> unit) -> unit = "getAuthToken" [@@bs.scope "chrome", "identity"] [@@bs.val]
external mkAuthOptions : ?interactive:Js.boolean -> ?scopes:string list -> ?account:accountInfo -> unit -> getAuthTokenOptions = "" [@@bs.obj]
external mkAccountInfo : ?id:string -> unit -> accountInfo = "" [@@bs.obj]

type window
external window : window = "window" [@@bs.val]
external onload : window -> (unit -> unit) -> unit = "onload" [@@bs.set]
