return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[┏─────────────────────────────┓]],
      [[│     *      ·   .   ·     *  │]],
      [[│  *     ·      /#\    .  .   │]],
      [[│      ·       /###\       ·  │]],
      [[│ ·  .        /#####\ ·       │]],
      [[│    ·   ·   /#######\  ·  ·  │]],
      [[│           / \#######\       │]],
      [[│  .    ·  /  / *######\   ·  │]],
      [[│         /  /    *#####\     │]],
      [[│    .   /  /   .   *####\  . │]],
      [[│  .    /  /         *####\   │]],
      [[│      /  /  .        *####,  │]],
      [[│     /  /       .     *###|  │]],
      [[│    /  /               *##'  │]],
      [[│   /  /                *#/   │]],
      [[│  /  /      (\ /)      ;/    │]],
      [[│ /  /       ( × ×)     /     │]],
      [[│/  /        J(")(")          │]],
      [[┗─────────────────────────────┛]],
    }
    dashboard.section.buttons.val = {}
    dashboard.section.footer.val =
      { "In the midst of winter, I found there", "was, within me, an invincible summer." }

    alpha.setup(dashboard.opts)
  end,
}
