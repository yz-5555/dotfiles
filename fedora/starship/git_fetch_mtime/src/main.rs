use std::fs;
use std::process::{Command, Stdio};
use std::time::SystemTime;

const HR: u64 = 3600;
const INTERVAL_HR: u64 = 4;

fn main() {
    let elapsed = get_fetch_head_mtime_elapsed().unwrap_or(u64::MAX);

    print_result(elapsed);

    if elapsed >= INTERVAL_HR * HR {
        fetch_async();
    }
}

fn get_fetch_head_mtime_elapsed() -> Option<u64> {
    let metadata = fs::metadata(".git/FETCH_HEAD").ok()?;

    if metadata.len() == 0 {
        return None;
    }

    let mtime = metadata.modified().ok()?;
    let elapsed = SystemTime::now().duration_since(mtime).ok()?;

    Some(elapsed.as_secs())
}

fn fetch_async() {
    let _ = Command::new("git")
        .args(["fetch", "--quiet"])
        .env("GIT_TERMINAL_PROMPT", "0")
        .env("GIT_SSH_VARIANT", "ssh")
        .env(
            "GIT_SSH_COMMAND",
            "ssh -o BatchMode=yes -o ConnectTimeout=3",
        )
        .stdin(Stdio::null())
        .stdout(Stdio::null())
        .stderr(Stdio::null())
        .spawn();
}

fn print_result(elapsed: u64) {
    if elapsed == u64::MAX {
        print!("null");
        return;
    }

    if elapsed >= 100 * 24 * HR {
        print!("99d+");
        return;
    }

    let days = elapsed / (24 * HR);
    let mut sec = elapsed % (24 * HR);

    let hrs = sec / HR;
    sec %= HR;

    let min = sec / 60;

    if days == 0 && hrs == 0 && min == 0 {
        print!("0m");
    } else {
        if days > 0 {
            print!("{}d", days);
        }
        if hrs > 0 {
            print!("{}h", hrs);
        }
        if min > 0 {
            print!("{}m", min);
        }
    }
}
