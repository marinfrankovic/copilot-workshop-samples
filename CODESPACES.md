# Run the workshop in GitHub Codespaces

Use a Codespace for this workshop so the required tools are ready without
installing anything on your computer. The Codespace includes Git, GitHub CLI,
Node.js, Python, Azure CLI, Bicep, and GitHub Copilot CLI.

## Start your Codespace

1. Open the workshop repository on GitHub.
2. Click **Code**, then open the **Codespaces** tab.
3. Select **Create codespace on main** and wait for the environment to finish
   its first-time setup.
4. Open the terminal with **Terminal > New Terminal**.
5. Confirm the tools are ready:

   ```bash
   copilot --version
   az version --output table
   python --version
   ```

## Start Copilot in the terminal

From the repository root, run:

```bash
copilot
```

At first launch, select the option to trust this workshop folder. If Copilot
asks you to sign in, enter `/login` and complete the GitHub sign-in flow. Then
type any quoted prompt from the lab directly into the Copilot terminal.

Copilot asks before it writes files or runs commands. Read each proposed action
and choose **Yes** only when it is appropriate. Press **Esc** to stop an action.

## Sign in to Azure

Exit Copilot with `Ctrl+C`, run the following in the regular terminal, then
restart Copilot with `copilot`:

```bash
az login --use-device-code
az account set --subscription "PASTE-YOUR-SUBSCRIPTION-ID-HERE"
az account show --output table
```

`az login --use-device-code` displays a URL and short code. Open the URL in a
new browser tab, enter the code, and sign in with the invited account.