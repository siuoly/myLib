#!/bin/bash
# https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
countdown() {
    start="$(( $(date +%s) + $1))"
    while [ "$start" -ge $(date +%s) ]; do
        ## Is this more than 24h away?
        days="$(($(($(( $start - $(date +%s) )) * 1 )) / 86400))"
        time="$(( $start - `date +%s` ))"
        printf '%s day(s) and %s\r' "$days" "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
mcountdown(){
  countdown "60 * $1"
}
stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

# e.g. countdown "$((2 * 60 * 60))" # for two hours

# block comment https://stackoverflow.com/questions/947897/block-comments-in-a-shell-script
: <<'END'
start=$(date +%s)
while true; do
    time="$(($(date +%s) - $start))"
    printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
    sleep 0.1
done

seconds=20
start="$(($(date +%s) + $seconds))"
while [ "$start" -ge `date +%s` ]; do
    time="$(( $start - `date +%s` ))"
    printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
    sleep 0.1
done
END
