use serde::Deserialize;

#[derive(Deserialize, Debug)]
pub struct Config {
    pub dotfiles: String,
}
