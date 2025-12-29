# ------------------------------------------------------------------------------
# BASE IMAGE
# texlive 'latest-full' because users are not bothered by missing packages later
# ------------------------------------------------------------------------------
FROM texlive/texlive:latest-full
# optionally use a tagged version for reproducability: 
# e.g. texlive/texlive:TL2025-2025-12-21

# ------------------------------------------------------------------------------
# SYSTEM PACKAGES
# tools that are NOT part of standard TeX Live but are needed for LaTeX projects
# ------------------------------------------------------------------------------
    # Inkscape: Required by the 'svg' package to convert .svg to .pdf on the fly.
    # Pygments: Required by the 'minted' package for code syntax highlighting.
    # Git: Essential for version control.
    # --------------------------------------------------------------------------
    # CLEANUP
    # remove the apt package lists to keep the image small.
    # --------------------------------------------------------------------------
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      inkscape \
      python3-pygments \
      git \
      chktex \
    && rm -rf /var/lib/apt/lists/*
