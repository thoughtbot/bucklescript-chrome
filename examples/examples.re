open Chrome.Identity;

let testGetAuthToken = () =>
  getAuthToken(
    mkAuthOptions(
      ~interactive=Js.true_,
      (),
      ~scopes=["scope"],
      ~account=mkAccountInfo(~id="id", ())
    ),
    (v) => Js.log(v)
  );

let testGetProfileUserInfo = getProfileUserInfo((userInfo) => Js.log(userInfo##email));

let testRemoveCachedAuthToken = removeCachedAuthToken({"token": "token"}, () => Js.log("Success"));

let testLaunchWebAuthFlow =
  launchWebAuthFlow(
    mkWebFlowOptions(~url="https://example.com", ()),
    (mResponseURL, ()) =>
      switch (Js.Null.to_opt(mResponseURL)) {
      | Some(responseUrl) => Js.log(responseUrl)
      | None => Js.log("No url returned!")
      }
  );

let testGetRedirectURL = getRedirectURL(Js.Null.from_opt(Some("path")));

let testOnSignInChanged =
  OnSignInChanged.addListener(
    (accountInfo, signedIn) => Js.log(signedIn) |> ((_) => Js.log(accountInfo##id))
  );
