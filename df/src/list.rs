use serde::Deserialize;

#[derive(Deserialize, Debug)]
pub struct Dotfile {
    pub original: String,
    pub copy: String,
}
#[derive(Deserialize, Debug)]
pub struct List {
    pub dotfiles: Vec<Dotfile>,
}
