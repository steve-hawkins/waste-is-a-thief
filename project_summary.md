# Project Summary: Waste is a Thief

## Overview

**Waste is a Thief** is a personal blog authored by Steve Hawkins, focusing on the sustainability of software products and broader environmental topics. The blog explores the intersection of software engineering, architectural practices, and decarbonization.

## Core Topics

- **Sustainable Software:** Insights into how software creates emissions and how to build low-impact products.
- **Energy & Emissions:** Discussions on green energy, regional energy generation differences, and emissions accounting.
- **Personal Decarbonization:** Practical experiences with home and travel decarbonization.
- **FinTech Context:** Insights derived from the author's experience in scaling SaaS platforms sustainably within the financial sector.

## Technology Stack

- **Static Site Generator:** [Jekyll](https://jekyllrb.com/)
- **Language/Environment:** Ruby (managed via `Gemfile` and `bundle`)
- **Hosting:** [GitHub Pages](https://pages.github.com/)
- **Infrastructure & Tooling:**
  - **Devcontainers:** Pre-configured development environment for VS Code and GitHub Codespaces.
  - **GitHub Actions:** Workflows for linting (`lint.yml`) and automated deployment (`jekyll.yml`).
  - **Shell Scripts:** Utility scripts like `scripts/verify_site.sh` for maintenance.

## Repository Structure

- `docs/`: The main directory containing the Jekyll source code.
  - `_posts/`: Markdown files for blog articles.
  - `assets/`: Images and other static media.
  - `_includes/`: Reusable HTML components (header, footer).
- `.github/`: Configuration for GitHub-specific features and CI/CD.
- `scripts/`: Maintenance and verification scripts.
- `README.md`: Basic setup and contribution guidelines.

## How to Contribute/Develop

The project is designed to be developed within a containerized environment. Standard Jekyll commands (`bundle exec jekyll serve`) are used to preview changes locally before they are deployed to GitHub Pages.
