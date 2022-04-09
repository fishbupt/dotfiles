local g = vim.g
g.dashboard_custom_header = {
	[[$$\    $$\ $$$$$$\ $$\      $$\         $$$$$$$\   $$$$$$\  $$\      $$\ $$$$$$$$\ $$$$$$$\  ]],
	[[$$ |   $$ |\_$$  _|$$$\    $$$ |        $$  __$$\ $$  __$$\ $$ | $\  $$ |$$  _____|$$  __$$\ ]],
	[[$$ |   $$ |  $$ |  $$$$\  $$$$ |        $$ |  $$ |$$ /  $$ |$$ |$$$\ $$ |$$ |      $$ |  $$ |]],
	[[\$$\  $$  |  $$ |  $$\$$\$$ $$ |$$$$$$\ $$$$$$$  |$$ |  $$ |$$ $$ $$\$$ |$$$$$\    $$$$$$$  |]],
	[[ \$$\$$  /   $$ |  $$ \$$$  $$ |\______|$$  ____/ $$ |  $$ |$$$$  _$$$$ |$$  __|   $$  __$$< ]],
	[[  \$$$  /    $$ |  $$ |\$  /$$ |        $$ |      $$ |  $$ |$$$  / \$$$ |$$ |      $$ |  $$ |]],
	[[   \$  /   $$$$$$\ $$ | \_/ $$ |        $$ |       $$$$$$  |$$  /   \$$ |$$$$$$$$\ $$ |  $$ |]],
	[[    \_/    \______|\__|     \__|        \__|       \______/ \__/     \__|\________|\__|  \__|]],
	[[                                                                                             ]],
	[[                             by fishbupt <fishbupt@gmail.com>                                ]],
}
g.dashboard_footer_icon = '🐬 '
g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
    change_colorscheme = {
        description = {' Scheme change              comma s c '},
        command = 'DashboardChangeColorscheme'
    },
    find_frecency = {
        description = {' File frecency              comma f r '},
        command = 'Telescope frecency'
    },
    find_history = {
        description = {'ч File history               comma f e '},
        command = 'DashboardFindHistory'
    },
    find_project = {
        description = {' Project find               comma f p '},
        command = 'Telescope sessions'
    },
    find_file = {
        description = {'で File find                  comma f f '},
        command = 'DashboardFindFile'
    },
    file_new = {
        description = {' File new                   comma f n '},
        command = 'DashboardNewFile'
    },
    find_word = {
        description = {' Word find                  comma f w '},
        command = 'DashboardFindWord'
    }
}
