use zed_extension_api::{self as zed, Result, settings::LspSettings};

struct SlangExtension {
}

impl SlangExtension {
    fn lsp_binary_path(
        &mut self,
        _language_server_id: &zed_extension_api::LanguageServerId,
        worktree: &zed_extension_api::Worktree,
    ) -> Result<String> {
        let binary_settings = LspSettings::for_worktree("slangd", worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.binary);

        if let Some(path) = binary_settings.and_then(|binary_settings| binary_settings.path) {
            return Ok(path);
        }

        if let Some(path) = worktree.which("slangd") {
            return Ok(path);
        }

        Err("Could not find the Slang language server binary. Please ensure it is installed and available in your PATH.".into())
    }
}

impl zed::Extension for SlangExtension {
    fn new() -> Self
    where
        Self: Sized,
    {
        SlangExtension {  }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &zed_extension_api::LanguageServerId,
        worktree: &zed_extension_api::Worktree,
    ) -> zed_extension_api::Result<zed_extension_api::Command> {
        let lsp_path = self.lsp_binary_path(language_server_id, worktree)?;
        Ok(zed_extension_api::Command {
            command: lsp_path,
            args: Default::default(),
            env: Default::default(),
        })
    }
}

zed::register_extension!(SlangExtension);
