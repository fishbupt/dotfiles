require("bufferline").setup({
	options = {
		numbers = "ordinal",
		modified_icon = "✥",
		buffer_close_icon = "",
    color_icons = true,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 20,
		max_prefix_length = 20,
		tab_size = 20,
		show_buffer_close_icons = true,
		show_buffer_icons = true,
		show_tab_indicators = true,
		separator_style = "thin",
		diagnostics = false,
		--diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				padding = 1,
			},
		},
	},
})

--local vimp = require("vimp")
--vimp.nnoremap("<A-Left>", ":BufferLineCyclePrev<cr>")
--vimp.nnoremap("<A-Right>", ":BufferLineCycleNext<cr>")
