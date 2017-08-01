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

let testLaunchWebAuthFlow = launchWebAuthFlow
    (mkWebFlowOptions
       ~url:"https://example.com" ())
    (fun mResponseURL () ->
       match (Js.Null.to_opt mResponseURL) with
       | Some responesUrl -> Js.log responesUrl
       | None -> Js.log "No url returned!")

let testGetRedirectURL = getRedirectURL (Js.Null.from_opt (Some "path"))

let () = onload window (fun () -> testGetAuthToken ())
