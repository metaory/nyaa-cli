# nyaa-cli

🚧 Download episodes in bulk from nyaa.si

---

## Features

- Download single episode
- Download episodes in a range

---

## Requirements

- Bash 5.0+
- jq
- curl
- pup (auto-installed if missing; requires Go for first-time install)

---

## Installation

```bash
git clone https://github.com/metaory/nyaa-cli.git
cd nyaa-cli
chmod +x nyaa-cli
sudo ln -sf "$(pwd)/nyaa-cli" /usr/local/bin/nyaa-cli
```

## Bash 5+ Requirement (macOS users)

This script requires **Bash 5.0 or later**.

On macOS, the default `/bin/bash` is too old.  
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
  (For Intel Macs, use `/usr/local/bin`.)

Check your Bash version:
```sh
bash --version
```
It should say 5.x or later.

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

## License
[MIT](LICENSE)