-- Preserve file identity so filesystem watchers detect writes reliably
vim.opt.backupcopy = "yes"

-- QML LSP completion
vim.lsp.enable("qmlls")

vim.opt.completeopt:append({
	"menuone",
	"noselect",
	"popup",
})

local function enable_lsp_completion(event)
	local client = assert(
		vim.lsp.get_client_by_id(event.data.client_id)
	)

	if not client:supports_method("textDocument/completion") then
		return
	end

	local trigger_characters = {}

	for char_code = 33, 126 do
		table.insert(
			trigger_characters,
			string.char(char_code)
		)
	end

	client.server_capabilities.completionProvider.triggerCharacters =
		trigger_characters

	vim.lsp.completion.enable(
		true,
		client.id,
		event.buf,
		{
			autotrigger = true,
		}
	)
end

vim.api.nvim_create_autocmd(
	"LspAttach",
	{
		group = vim.api.nvim_create_augroup(
			"lsp-completion",
			{ clear = true }
		),
		callback = enable_lsp_completion,
	}
)
