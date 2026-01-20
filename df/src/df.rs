use std::path::{Path, PathBuf};
use std::{env, fs};

use clap::Parser;
use fs_extra::dir::{CopyOptions, copy};

use super::cli::{Args, Mode};
use super::config::Config;
use super::list::List;

pub fn run() {
    read_config();
    read_list();
}
pub fn read_config() {
    let path = untildify("~/.config/df-config.toml");
    let contents = fs::read_to_string(path).expect("ERR: WRONG PATH");

    let config: Config = toml::from_str(&contents).expect("ERR: FAILED TO PARSE");
    let cwd = untildify(&config.dotfiles);

    env::set_current_dir(cwd).expect("ERR: FAILED TO CHANGE CWD");
}
pub fn read_list() {
    let args = Args::parse();
    let mut list_path = untildify(&args.target);
    list_path.push("df-list.toml");

    let contents = fs::read_to_string(&list_path).expect("ERR: WRONG PATH");

    let list: List = toml::from_str(&contents).expect("ERR: FAILED TO PARSE");

    env::set_current_dir(list_path.parent().expect("ERR: FAILED TO FIND PARENT"))
        .expect("ERR: FAILED TO CHANGE CWD");

    for dotfile in list.dotfiles {
        if matches!(args.mode, Mode::Push) {
            update(&dotfile.original, &dotfile.copy);
        } else {
            update(&dotfile.copy, &dotfile.original);
        }
    }
}
pub fn update(src: &str, dst: &str) {
    let s = untildify(src);
    let d = untildify(dst);
    let mut options = CopyOptions::new();
    options.content_only = true;
    options.overwrite = true;

    // if s.is_file() and d.is_file() result differently, it's totally fucked up.
    if s.is_file() {
        fs::copy(s, d)
            .unwrap_or_else(|e| panic!("ERR: FAILED TO COPY FILE {} to {} / {}", src, dst, e));
        println!("LOG: COPIED FILE {} TO {}", src, dst);
        // println!("file, exists: s{} d{}", Path::exists(s), Path::exists(d));
    } else if s.is_dir() {
        copy(s, d, &options)
            .unwrap_or_else(|e| panic!("ERR: FAILED TO COPY DIR {} TO {} / {}", src, dst, e));
        println!("LOG: COPIED DIR {} TO {}", src, dst);
        // println!("dir, exists: s{} d{}", Path::exists(s), Path::exists(d));
    } else {
        println!("WARN: {} NOT FOUND", src);
    }
}
pub fn untildify(input_path: &str) -> PathBuf {
    let path = Path::new(input_path);

    if path.starts_with("~") {
        #[allow(deprecated)]
        if let Some(home) = std::env::home_dir() {
            let mut components = path.components();
            components.next();
            return home.join(components.collect::<PathBuf>());
        }
    }
    PathBuf::from(input_path)
}
