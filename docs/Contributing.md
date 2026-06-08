# Contributing

This site is a Docsify site. The documentation content already lives directly in the [`docs/`](https://github.com/gravity-doc/gravity-doc.github.io/tree/master/docs) folder, so normal updates are just Markdown edits.

## Quick workflow

1. Fork the repository on GitHub.
2. Edit the page you want to change under `docs/`.
3. If you add a new page, update [`docs/_sidebar.md`](https://github.com/gravity-doc/gravity-doc.github.io/blob/master/docs/_sidebar.md) so it appears in the navigation.
4. Open a pull request against `master`.

## How it is served

The same `docs/` content is published in two places:

- [GitHub Pages](https://gravity-doc.github.io), which serves this repository as a Docsify site.
- [gravity.sjtu.edu.cn/doc](https://gravity.sjtu.edu.cn/doc), which mirrors the documentation through a separate Docsify server deployment.

In both cases, the source of truth is still the Markdown and asset files under `docs/`. Normal documentation updates do not require a conversion step or a generated build artifact.

## What to edit

- Home page: [`docs/README.md`](https://github.com/gravity-doc/gravity-doc.github.io/blob/master/docs/README.md)
- Navigation sidebar: [`docs/_sidebar.md`](https://github.com/gravity-doc/gravity-doc.github.io/blob/master/docs/_sidebar.md)
- Top navigation: [`docs/_navbar.md`](https://github.com/gravity-doc/gravity-doc.github.io/blob/master/docs/_navbar.md)
- Page content: files under [`docs/`](https://github.com/gravity-doc/gravity-doc.github.io/tree/master/docs)
- Images and videos: files under [`docs/images/`](https://github.com/gravity-doc/gravity-doc.github.io/tree/master/docs/images)

## Notes

- No conversion or local build step is required for normal documentation updates.
- Small fixes and Chinese-language contributions are welcome.
