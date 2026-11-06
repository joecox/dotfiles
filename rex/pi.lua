-- Cmd+Option+P: fresh Pi conversation in a new Rex session/workspace.
rex.action{
  name = "new_pi_session",
  title = "New Pi Session",
  description = "Start Pi in a new Rex session",
  run = function()
    local created, create_err = rex.call("session.create", {
      initial_windows = {
        {
          layout = rex.layout.block{
            flavor = "com.superlogical.terminal.shell",
            options = {
              command = { "pi" },
            },
          },
        },
      },
    })
    if not created then error(create_err, 0) end

    rex.client.queue("session.select", {
      session_id = created.session_id,
      window_id = created.initial_windows[1].window_id,
    })
    return created
  end,
}

rex.bind("cmd+alt+p", "new_pi_session")
