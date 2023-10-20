repos=(
    blockbench
    blockbench-bin
    blockbench-git
    blockify-git
    espanso-git
    espanso-wayland-git
    eza-git
    fast-discord-git
    flaresolverr
    flaresolverr-bin
    gtkcord4
    gtkcord4-bin
    gtkcord4-git
    illarion-bin
    imgbrd-grabber-appimage
    jackett
    jackett-bin
    jackett-mono
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
    ttf-monocraft
    ttf-mutant-emoji
    ttf-unifont
    vimv-git
    yt-spammer-purge
    zaread-git
)

for repo in "${repos[@]}"; do
    aurpublish --pull "${repo}"
done

