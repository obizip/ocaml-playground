FROM ocaml/opam:debian-ocaml-5.3

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV PATH="/home/opam/.local/bin:$PATH"
ENV PATH="/home/opam/.local/share/mise/shims:$PATH"

RUN sudo apt-get update  \
    && sudo apt-get -y --no-install-recommends install  \
        # install any other dependencies you might need
        sudo curl wget tree git tree vim ca-certificates build-essential \
    && sudo rm -rf /var/lib/apt/lists/*

RUN opam install dune ocaml-lsp-server ocamlformat

RUN curl https://mise.run | sh
RUN mise use -g bat eza fzf gh lazygit neovim pre-commit ripgrep starship task usage yazi
