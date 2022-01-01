# McGov.ie

[![Website](https://img.shields.io/website?label=mcgov.ie&style=for-the-badge&url=https%3A%2F%2Fcodestackr.com)](https://mcgov.ie)

This is my new wordpress-free website! It includes a landing page, about me section, blog, projects list, and contact page.

## Creating Page

You can create the page manually in 'en' and 'ga' in content with your own frontmatter. The frontmatter in the file would look like this:

```console
---
title: "My First Post"
date: 2019-03-26T08:47:11+01:00
draft: true
---
```

You can use hugo to create a page, like I will show below:

```console
hugo new posts/my-first-post.md
hugo new projects/my-first-project.md
```

## Publishing Website Changes

I've written a workflow that deploys the website to [https://mcgov.ie](https://mcgov.ie) whenever a PR is merged into main from any branch. This method can be used to update any aspect of the website.

## Using This Repo As An Example

The only things that need to be changed on this site to make it usuable for another site is to update [config.toml](https://github.com/mcgovman/mcgov.ie/blob/master/config.toml) with your own content and baseURL, [docker-compose.prod.yml](https://github.com/mcgovman/mcgov.ie/blob/master/docker-compose.prod.yml) with any port/traefik configuration, [.github/workflows/deploy-prod.yml](https://github.com/mcgovman/mcgov.ie/blob/master/.github/workflows/deploy-prod.yml) with your own server secrets, and [deploy/deploy-prod.sh](https://github.com/mcgovman/mcgov.ie/blob/master/deploy/deploy-prod.sh) with your own deploy script.

## License

McGov.ie & Coder is licensed under the [MIT license](https://github.com/mcgovman/mcgov.ie/blob/master/LICENSE).

## Updating Theme

Here is a git workflow for updating your fork (or downloaded copy) to the latest version:

```console
cd themes
git remote add upstream https://github.com/luizdepra/hugo-coder.git
git fetch upstream
git merge upstream/main
# resolve the merge conflicts in your editor
git add . -u
git commit -m 'Updated to the latest version'
```

## Theme Maintenance

This theme is maintained by its author [Luiz de Prá](https://github.com/luizdepra) with the help from these awesome [contributors](https://github.com/luizdepra/hugo-coder/blob/master/CONTRIBUTORS.md).
