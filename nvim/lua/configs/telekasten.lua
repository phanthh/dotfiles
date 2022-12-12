local home = vim.fn.expand("~/Academia/mlnotes")
require("telekasten").setup({
	home = home,
	take_over_my_home = false,
	auto_set_filetype = false,
	-- dailies = home .. "/" .. "daily",
	-- weeklies = home .. "/" .. "weekly",
	-- templates = home .. "/" .. "templates",

	-- image (sub)dir for pasting
	-- dir name (absolute path or subdir name)
	-- or nil if pasted images shouldn't go into a special subdir
	image_subdir = "statics",

	-- markdown file extension
	extension = ".md",
	new_note_filename = "title",
	uuid_type = "%Y%m%d%H%M",
	uuid_sep = "-",

	-- following a link to a non-existing note will create it
	follow_creates_nonexisting = true,
	-- dailies_create_nonexisting = true,
	-- weeklies_create_nonexisting = true,

	-- skip telescope prompt for goto_today and goto_thisweek
	journal_auto_open = false,

	-- template for new notes (new_note, follow_link)
	-- set to `nil` or do not specify if you do not want a template
	template_new_note = home .. "/" .. "templates/template.md",

	-- template for newly created daily notes (goto_today)
	-- set to `nil` or do not specify if you do not want a template
	-- template_new_daily = home .. "/" .. "templates/daily.md",

	-- template for newly created weekly notes (goto_thisweek)
	-- set to `nil` or do not specify if you do not want a template
	-- template_new_weekly = home .. "/" .. "templates/weekly.md",

	-- image link style
	-- wiki:     ![[image name]]
	-- markdown: ![](image_subdir/xxxxx.png)
	image_link_style = "wiki",

	-- default sort option: 'filename', 'modified'
	sort = "filename",

	-- integrate with calendar-vim
	plug_into_calendar = false,

	-- telescope actions behavior
	close_after_yanking = false,
	insert_after_inserting = true,

	-- tag notation: '#tag', ':tag:', 'yaml-bare'
	tag_notation = "#tag",

	-- command palette theme: dropdown (window) or ivy (bottom panel)
	command_palette_theme = "ivy",

	-- tag list theme:
	-- get_cursor: small tag list at cursor; ivy and dropdown like above
	show_tags_theme = "ivy",

	-- when linking to a note in subdir/, create a [[subdir/title]] link
	-- instead of a [[title only]] link
	subdirs_in_links = false,

	-- template_handling
	-- What to do when creating a new note via `new_note()` or `follow_link()`
	-- to a non-existing note
	-- - prefer_new_note: use `new_note` template
	-- - smart: if day or week is detected in title, use daily / weekly templates (default)
	-- - always_ask: always ask before creating a note
	template_handling = "prefer_new_note",

	-- path handling:
	--   this applies to:
	--     - new_note()
	--     - new_templated_note()
	--     - follow_link() to non-existing note
	--
	--   it does NOT apply to:
	--     - goto_today()
	--     - goto_thisweek()
	--
	--   Valid options:
	--     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
	--              all other ones in home, except for notes/with/subdirs/in/title.
	--              (default)
	--
	--     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
	--                    except for notes with subdirs/in/title.
	--
	--     - same_as_current: put all new notes in the dir of the current note if
	--                        present or else in home
	--                        except for notes/with/subdirs/in/title.
	new_note_location = "prefer_home",

	-- should all links be updated when a file is renamed
	rename_update_links = true,

	vaults = {
		vault2 = {
			-- alternate configuration for vault2 here. Missing values are defaulted to
			-- default values from telekasten.
			-- e.g.
			-- home = "/home/user/vaults/personal",
		},
	},

	-- how to preview media files
	-- "telescope-media-files" if you have telescope-media-files.nvim installed
	-- "catimg-previewer" if you have catimg installed
	media_previewer = "catimg",

	-- A customizable fallback handler for urls.
	follow_url_fallback = nil,
})
