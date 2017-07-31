open Chrome

let testGetAuthToken () = getAuthToken
    (mkAuthOptions
       ~interactive:Js.true_ ()
       ~scopes:["scope"]
       ~account:(mkAccountInfo ~id:"id" ()))
    (fun v ->
       Js.log v)

let testGetProfileUserInfo = getProfileUserInfo (fun userInfo ->
    Js.log userInfo##email
  )

let testRemoveCachedAuthToken = removeCachedAuthToken [%bs.obj { token = "token" } ] (fun () ->
    Js.log "Success"
  )

let () = onload window (fun () -> testGetAuthToken ())
