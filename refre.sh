repos=(
    archosaur
    archosaur-bin
    archosaur-git
    blockbench
    blockbench-bin
    blockbench-git
    blockify-git
    dissent-git
    espanso-git
    espanso-wayland-git
    eza-git
    fast-discord-git
    flaresolverr
    flaresolverr-bin
    gpt-engineer
    gtkcord4
    gtkcord4-bin
    illarion-bin
    imgbrd-grabber-appimage
    java-openjdk-wakefield
    linux-command-gpt
    linux-command-gpt-git
    openssh-askpass
    otf-monocraft
    otf-unifont
    packwiz-git
    prismlauncher
    prismlauncher-bin
    prismlauncher-git
    prismlauncher-qt5
    prismlauncher-qt5-bin
    prismlauncher-qt5-git
    progress-quest-bin
    python-baycomp
    python-langchain
    python-langchain-community
    python-langchain-core
    python-langsmith
    python-objection
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
    ttf-mutant-emoji
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

