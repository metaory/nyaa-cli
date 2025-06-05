<div align="center">
    <h1>nyaa-cli</h1>
    <img src=".github/logo.svg" alt="nyaa-cli" width="128" height="128">
    <h4>Smart anime torrent fetcher with stateful episode tracking</h4>
</div>

---

<p align="center">
  <a href="#requirements">Requirements</a> |
  <a href="#usage">Usage</a> |
  <a href="#state">State</a>
</p>


## Requirements

- `Bash 5.0+`
- `jq`
- `curl`
- `pup` _(requires Go for first-time installation)_
- `Go` _(only needed for first-time installation of `pup`)_

---

## Installation

```sh
# clone the repository
git clone https://github.com/metaory/nyaa-cli.git
cd nyaa-cli

# make the script executable
chmod +x nyaa-cli

# symlink the script to somewhere in $PATH
sudo ln -sf "$(pwd)/nyaa-cli" /usr/local/bin/nyaa-cli
```

<details>
<summary><strong>Bash 5+ (macOS users only)</strong></summary>

This script requires <strong>Bash 5.0 or later</strong>.

On macOS, the default <code>/bin/bash</code> is too old.  
Install the latest Bash with Homebrew:

```sh
brew install bash
```

Then, either:
- Run the script with the full path:
  ```sh
  /opt/homebrew/bin/bash ./nyaa-cli ...
  ```
- Or, add Homebrew Bash to your PATH (Apple Silicon):
  ```sh
  echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  ```
  (For Intel Macs, use <code>/usr/local/bin</code>)

Check your Bash version:
```sh
bash --version
```
It should say `5.x` or later

</details>

## Usage

```bash
# Basic usage - continues from last downloaded episode
nyaa-cli --name "one piece"

# Download a specific episode
nyaa-cli --name "one piece" --episode 120

# Download all episodes from a starting point
nyaa-cli --name "one piece" --from 120

# Download a specific range of episodes
nyaa-cli --name "one piece" --from 120 --to 130

# Additional options
nyaa-cli --name "one piece" --from 120 --quality "720"
nyaa-cli --name "one piece" --from 120 --uploader "Erai"
```

### Usage Patterns

The script supports four main usage patterns:

1. **Continue from Last Episode** (`--name` only)
   - Automatically continues from the last downloaded episode
   - If no previous episodes found, starts from episode 1
   - Uses state file to track progress

2. **Single Episode** (`--episode`)
   - Downloads a specific episode
   - Cannot be used with `--from` or `--to`
   - Example: `--episode 120`

3. **From Episode to Present** (`--from` without `--to`)
   - Downloads all available episodes from the starting point
   - Continues until no more episodes are found
   - Example: `--from 120`

4. **Episode Range** (`--from` and `--to`)
   - Downloads episodes within a specific range
   - `--to` must be greater than `--from`
   - Example: `--from 120 --to 130`

### Additional Options

| Option      | Description                                              | Required | Default |
|-------------|----------------------------------------------------------|----------|---------|
| --name      | The name of the anime                                    | Yes      | -       |
| --episode   | Download a single episode                                | No       | -       |
| --from      | The starting episode number                              | No       | -       |
| --to        | The ending episode number                                | No       | -       |
| --quality   | The quality of the episode (480, 720, 1080)              | No       | 720     |
| --uploader  | The uploader of the episode (`Erai`, `SubsPlease`, ...)  | No       | -       |

---

## State

The script maintains a state file at `~/.local/state/nyaa-cli/progress` to track the last downloaded episode for each anime. The state file is a TSV (Tab-Separated Values) file where:

- First column: Normalized anime name
- Second column: Last downloaded episode number

Example state file:
```
one+piece	1278
solo+leveling	18
```

The state is automatically updated whenever an episode is downloaded, and is used to:
- Continue from the last downloaded episode when no episode is specified
- Track progress across multiple runs
- Start from episode 1 for new anime

---

<details>
<summary><strong>Example Workflow</strong></summary>

You can use `nyaa-cli` to automate your anime downloads with a torrent client that supports directory watching. For example, with **rtorrent**, you can configure it to watch a directory for new `.torrent` files. When a torrent file is placed there, rtorrent will automatically start downloading it.

A typical workflow:

1. Configure your torrent client (e.g., rtorrent) to watch a directory (e.g., `~/watch/torrents`).

2. Create a script to download new episodes (e.g., `~/bin/update-anime.sh`):
   ```sh
   #!/bin/bash
   
   # Update One Piece
   nyaa-cli --name "one piece"
   
   # Update Solo Leveling
   nyaa-cli --name "solo leveling"
   ```

3. Make the script executable:
   ```sh
   chmod +x ~/bin/update-anime.sh
   ```

4. Add a weekly cronjob to run the script (e.g., every Sunday at 2 AM):
   ```sh
   # Edit crontab
   crontab -e
   
   # Add this line
   0 2 * * 0 ~/bin/update-anime.sh
   ```

The script will:
- Use the state file to automatically continue from the last downloaded episode
- Download new episodes if available
- Your torrent client will pick up the new files and start downloading automatically

Many other torrent clients also support directory watching for automation.

</details>

---

## License
[MIT](LICENSE)