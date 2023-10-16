table.insert(default_access.rules, {
	matches = {
		{
			{ "application.process.binary", "=", "ferdium" },
		},
	},
	default_permissions = "rx",
})
