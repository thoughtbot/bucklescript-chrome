type chrome

external getAuthToken : 'a Js.t -> (chrome -> string -> unit [@bs.this]) -> unit = "getAuthToken" [@@bs.scope "chrome", "identity"] [@@bs.val]

type window
external window : window = "window" [@@bs.val]
external onload : window -> (unit -> unit) -> unit = "onload" [@@bs.set]
