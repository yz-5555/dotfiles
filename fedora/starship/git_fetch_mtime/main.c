// clang-format off
#include <stdio.h>
#include <sys/wait.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>

#if defined(_WIN32) || defined(WIN32)
    #include <sys/utime.h>
    #define STAT _stat
    #define FETCH fetch_windows
#else
    #include <unistd.h>
    #define STAT stat
    #define FETCH fetch_linux
#endif
// clang-format on

#define HR 3600
#define INTERVAL_HR 4

void fetch_winows() {}
void fetch_linux() {
    pid_t pid = fork();
    if (pid < 0) {
        return;
    } else if (pid == 0) {
        char *args[] = {"git", "fetch", "--quiet", NULL};
        execvp("git", args);
    } else {
        int status;
        if (waitpid(pid, &status, 0) == -1) {
            return;
        }
    }
}
void print_result(double diff) {
    long sec = (long)diff;

    if (sec >= 100 * 24 * HR) { // 100 days
        fputs("99d+", stdout);
        return;
    }

    long days = sec / (24 * HR);
    sec %= (24 * HR);

    long hrs = sec / HR;
    sec %= HR;

    long min = sec / 60;

    if (days == 0 && hrs == 0 && min == 0) {
        fputs("0m", stdout);
    } else {
        // clang-format off
        if (days > 0) printf("%ldd", days);
        if (hrs > 0)  printf("%ldh", hrs);
        if (min > 0)  printf("%ldm", min);
        // clang-format on
    }
}

int main(void) {
    struct STAT st;

    if (STAT(".git", &st) != 0) {
        fputs("null", stdout);
        return 0;
    }

    if (STAT(".git/FETCH_HEAD", &st) != 0) {
        fputs("null", stdout);
        FETCH();
        return 0;
    }

    time_t mtime = st.st_mtime;
    time_t now = time(NULL);
    double diff = difftime(now, mtime);

    // Comment these lines to disable auto-fetch.
    // ============================
    if (diff >= INTERVAL_HR * HR)
        FETCH();
    // ============================

    print_result(diff);

    return 0;
}
