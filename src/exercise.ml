open Chrome

let testGetAuthToken () = getAuthToken
    (mkAuthOptions
       ~interactive:Js.true_ ()
       ~scopes:["scope"]
       ~account:(mkAccountInfo ~id:"id" ()))
    (fun v ->
       Js.log v)

let () = onload window (fun () -> testGetAuthToken ())

