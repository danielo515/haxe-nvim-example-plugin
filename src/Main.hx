import vim.Vim;
import vim.Vimx;
import vim.VimTypes;
import lua.Table.create as t;

function main() {
	// Example of a command that supports auto-completion and takes arguments
	vim.Api.create_user_command_completion("HaxeCmd", (args) -> {
		Vim.print(args);
		final spellRes = Spell.check("Hello bru! Hau are you?");
		Vim.print(spellRes[1].first());
		vim.Ui.select(t(["a"]), {prompt: "Pick one sexy option"}, (choice, _) -> Vim.print(choice));
	}, CustomLua("require'packer'.plugin_complete"), {
		desc: "Testing from haxe",
		force: true,
		bang: true,
		range: WholeFile,
	});
	// Example of an autocmd that is triggered when a file is saved with the extension .hx only once
	// This uses the higher level Vimx API
	Vimx.autocmd('HaxeEvent', [BufWritePost], "*.hx", "Created from haxe", () -> {
		var filename = Vim.expand(ExpandString.plus(CurentFile, FullPath));
		Vim.print('Hello from axe', filename);
		return true;
	});
	// One example keymap that actually does something useful
	vim.Keymap.set(Normal, "tl", nexTab, {desc: "Go to next tab", silent: true, expr: false});
	// Example showing how to configure vim options. This one shows the effects of a search / replace in a live preview window
	Vim.o.inccommand = "split";
}

// Example of a function that uses some of the provided Vim specific helpers
// to write succinct code that is also type safe

/**
	Goes to the next tab, cycling to the first on the edges
 */
function nexTab() {
	final pages = vim.Api.nvim_list_tabpages();
	final currentTab = vim.Api.nvim_get_current_tabpage();
	final nextT = pages.findNext(id -> id == currentTab);
	vim.Api.nvim_set_current_tabpage(nextT.or(pages[1]));
}
