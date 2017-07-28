open Chrome

let main () = getAuthToken [%bs.obj { interactive = Js.true_ }] (fun [@bs.this] o v -> Js.log v)

let () = onload window main
