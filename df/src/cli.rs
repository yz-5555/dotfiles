use clap::{Parser, ValueEnum};

#[derive(ValueEnum, Clone, Debug)]
pub enum Mode {
    Push,
    Pull,
}

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
pub struct Args {
    #[arg(value_enum, index = 1)]
    pub mode: Mode,

    #[arg(index = 2, default_value = ".")]
    pub target: String,
}
