# server: start a file server at a random (0) or provided port
function server --description "file server";
    if set -q argv[1]
        set -f port $argv[1]
    else
        set -f port 0
    end

    python3 -m http.server $port
end
