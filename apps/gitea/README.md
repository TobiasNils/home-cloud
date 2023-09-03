# Gitea

## Configure through env

https://github.com/go-gitea/gitea/blob/main/contrib/environment-to-ini/environment-to-ini.go

Environment variables of the form "GITEA__SECTION_NAME__KEY_NAME"
will be mapped to the ini section "[section_name]" and the key
"KEY_NAME" with the value as provided.

```     
        """
		...
		[log.console]
		COLORIZE=false
		STDERR=true
		...
		"""

	Set by environment variables: "GITEA__LOG_0x2E_CONSOLE__COLORIZE=false"
```

## Actions

https://docs.gitea.com/usage/actions/quickstart

