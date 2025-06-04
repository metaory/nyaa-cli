# nyaa-cli

🚧 Download episodes in bulk from nyaa.si

---

## Features

- Download single episode
- Download episodes in a range

---

> [!CAUTION]
> 🚧 This is a work in progress.

---

## Installation

```bash
git clone https://github.com/metaory/nyaa-cli.git
cd nyaa-cli
chmod +x nyaa-cli
sudo ln -sf "$(pwd)/nyaa-cli" /usr/local/bin/nyaa-cli
```

## Usage

```bash
nyaa-cli --help

# Download the 120th episode of one piece
nyaa-cli --name "one piece" --ep 120

# Download the 120th episode of one piece from Erai
nyaa-cli --name "one piece" --ep 120 --uploader "Erai"

# Download the 120th to 130th episode of one piece
nyaa-cli --name "one piece" --from 120

# Download the 120th to 130th episode of one piece
nyaa-cli --name "one piece" --from 120 --to 130

# Download the 120th episode of one piece in 720p quality
nyaa-cli --name "one piece" --from 120 --quality "720"

# Download the 120th episode of one piece in 720p quality and save it to ~/Downloads
nyaa-cli --name "one piece" --from 120 --quality "720" --output "~/Downloads"
```

---

## Options

| Option      | Description                                              | Required | Default |
|-------------|----------------------------------------------------------|----------|---------|
| --name      | The name of the anime                                    | Yes      | -       |
| --ep        | The episode number                                       | Yes      | -       |
| --from      | The starting episode number                              | No       | -       |
| --to        | The ending episode number                                | No       | -       |
| --quality   | The quality of the episode (480, 720, 1080)              | No       | 720     |
| --output    | The output directory                                     | No       | `$PWD`  |
| --uploader  | The uploader of the episode (`Erai`, `Subsplease`, ...)  | No       | -       |

- `--from` and `--ep` can't be used together.
- `--from` without `--to` will download all episodes available episodes from the starting episode.
- not specifying the `--uploader` will select the highest seeder.

---

## License
[MIT](LICENSE)