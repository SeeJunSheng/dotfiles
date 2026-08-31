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

	local triggerCharacters = {}

	for charCode = 33, 126 do
		table.insert(
			triggerCharacters,
			string.char(charCode)
		)
	end

	client.server_capabilities.completionProvider.triggerCharacters =
		triggerCharacters

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
