repos=(
    archosaur
    archosaur-bin
    archosaur-git
    blockbench
    blockbench-bin
    blockbench-git
    dissent
    dissent-bin
    dissent-git
    dpitunnel
    dpitunnel-bin
    dpitunnel-git
    espanso-git
    eza-git
    fast-discord-git
    flaresolverr
    flaresolverr-bin
    gpt-engineer
    halloy
    halloy-bin
    halloy-git
    illarion-bin
    imgbrd-grabber-appimage
    java-openjdk-wakefield
    libfm-qt-git
    linux-command-gpt
    linux-command-gpt-git
    makemkv
    openssh-askpass
    otf-monocraft
    otf-unifont
    packwiz-git
    pcmanfm-qt-git
    prismlauncher-bin
    prismlauncher-git
    prismlauncher-qt5
    prismlauncher-qt5-bin
    prismlauncher-qt5-git
    progress-quest-bin
    python-baycomp
    python-confusables
    python-pox
    python-pykakasi
    python-syncedlyrics
    ripcord
    ripcord-arch-libs
    ripme
    ripme-bin
    ripme-git
    soundsense
    soundsense-rs-git
    stevenarella-git
    thesage
    trelby
    trelby-git
    ttf-unifont
    vimv-git
    yt-spammer-purge
    zaread-git
)

for repo in "${repos[@]}"; do
    echo ''
    echo "--> Pulling ${repo}"
    archosaur --pull "${repo}"
done

