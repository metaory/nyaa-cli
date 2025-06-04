
<div align="center">
    <h1>nyaa-cli</h1>
    <img src=".github/logo.svg" alt="nyaa-cli" width="128" height="128">
    <h5>Bulk anime torrent fetcher for <a href="https://nyaa.si">nyaa.si</a></h5>
</div>

---

<p align="center">
  <a href="#requirements">Requirements</a> |
  <a href="#usage">Usage</a> |
  <a href="#roadmap">Roadmap</a>
</p>


## Requirements

- `Bash 5.0+`
- `jq`
- `curl`
- `pup` _(auto-installed if missing)_
- `Go` _(for first-time installation of `pup`)_

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
nyaa-cli --help

# Download the 120th episode of one piece
nyaa-cli --name "one piece" --ep 120

# Download the 120th episode of one piece from Erai
nyaa-cli --name "one piece" --ep 120 --uploader "Erai"

# Download all episodes from 120 onward
nyaa-cli --name "one piece" --from 120

# Download episodes 120 to 130
nyaa-cli --name "one piece" --from 120 --to 130

# Download episodes from 120 in 720p quality
nyaa-cli --name "one piece" --from 120 --quality "720"
```

---

## Options

| Option      | Description                                              | Required | Default |
|-------------|----------------------------------------------------------|----------|---------|
| --name      | The name of the anime                                    | Yes      | -       |
| --ep        | The episode number                                       | Yes*     | -       |
| --from      | The starting episode number                              | Yes*     | -       |
| --to        | The ending episode number                                | No       | -       |
| --quality   | The quality of the episode (480, 720, 1080)              | No       | 720     |
| --uploader  | The uploader of the episode (`Erai`, `SubsPlease`, ...)  | No       | -       |

- `--from` and `--ep` can't be used together.
- Either `--ep` or `--from` is required.
- `--from` without `--to` will download all available episodes from the starting episode.
- Not specifying the `--uploader` will select the highest seeder.

---

## Example Workflow

You can use `nyaa-cli` to automate your anime downloads with a torrent client that supports directory watching. For example, with **rtorrent**, you can configure it to watch a directory for new `.torrent` files. When a torrent file is placed there, rtorrent will automatically start downloading it.

A typical workflow:

1. Configure your torrent client (e.g., rtorrent) to watch a directory (e.g., `~/watch/torrents`).
2. Use `nyaa-cli` to download torrent files directly into that directory:
   ```sh
   nyaa-cli --name "one piece" --from 120 > ~/watch/torrents
   ```
3. Your torrent client will pick up the new files and start downloading automatically.

Many other torrent clients also support directory watching for automation.

---

## Roadmap

| Feature / Idea                                           | State |
|----------------------------------------------------------|:-----:|
| Download a single episode with `--ep`                    | 🟢    |
| Download a range from `--from` to present                | 🟢    |
| Download a range from `--from` to `--to`                 | 🟢    |
| Filter by `--quality` (e.g. 720, 1080)                   | 🟢    |
| Filter by `--uploader` (e.g. Erai, SubsPlease)           | 🟢    |
| Output directory selection                               | 🟡️    |
| Auto-resume: track last episode per series               | ⚪️    |

---

## License
[MIT](LICENSE)