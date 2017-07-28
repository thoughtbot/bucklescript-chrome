open Chrome

let main () = getAuthToken [%bs.obj { interactive = Js.true_ }] (fun v -> Js.log v)

let () = onload window main
