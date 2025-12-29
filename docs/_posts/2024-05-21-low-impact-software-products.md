---
layout: post
title: "low impact software products"
date: 2024-05-21
tags: green_software vscode devcontainer github github_actions github_pages github_codespaces jekyll website_carbon_calculator
---

> [!WARNING]
> If you are not familiar with the environmental impact of software products like websites, applications and SaaS platforms then you might want to start with my post on [how does software create emissions?]({% post_url 2024-05-21-how-does-software-create-emissions %})

## a practical example

It wouldn't be polite for me to write this blog about sustainable software products and share it with the world on a solution that had a high impact on the environment now would it.

So I am going to write a series of posts about my investigations into the causes of emissions from software and some of the solutions I have trialled whilst creating this blog.

Let's start the journey by talking about the software engineers device itself.  Commonly this has been a high-powered usually full tower desktop, quite often with parts like CPU and GPU being upgraded on a regular cadence which in turn requires the other components like motherboard, cooling, PSU, etc to be upgraded after sometime as well.

> [!NOTE]
> This fear of missing out and constant push for the latest and greatest is certainly not limited to software engineers, think about mobile phones, tablets, cameras, etc.
>
> It is a serious e-waste issue and [the UN has stated that by 2030, global e-waste could increase by 39%, rising to 74.7 mT per year.](https://www.tier1.com/e-waste-are-we-literally-throwing-away-millions-of-pounds/)

To compound this e-waste issue there is also an unexpectedly large carbon footprint in the [creation and transportation](https://circularcomputing.com/news/carbon-footprint-laptop/) of these physical goods.

So what is the solution to the software engineers device?  Reduce waste, only use what is necessary to do the job well, that's it, anything else can be seen as excess.

Now this is just a simple blog, but I want to see how far I can take a few of these looking for waste concepts into bigger and more complex software products another day.  For now let's dive into how I created [wiat.io](https://wiat.io/).

### my device of choice

I have been using work devices only for a number of years now and needed a new personal device for this project, so I purchased a two year old Google Pixelbook Go off eBay for under £200 that will continue to receive updates until 2029.  Being a ChromeOS browser based device, this felt quite the opposite to a normal software engineers device.

ChromeOS devices are generally speaking (especially Google built ones) lower impact devices to create and operate in terms of consumption of resources, they are great for general personal, school and work related activities, but could it be used for software development?  Let's see how it goes.

I started off by enabling developer mode and going about installing vscode (Visual Studio Code) on the local Debian container that developer mode creates, Microsoft provides a pretty good guide on their [vscode site](https://code.visualstudio.com/blogs/2020/12/03/chromebook-get-started).

All good so far and vscode feels like it does on any other device.

### code storage, application build and hosting

I went for GitHub as they, and Microsoft their parent company, have [robust environmental sustainability commitments](https://github.blog/2021-04-22-environmental-sustainability-github/).  I still need to look into the alternatives in terms of environmental impact in more detail, but the fact I could store the code in a GitHub repository, develop with [GitHub Codespaces](https://github.com/features/codespaces) (more on this later), build with [GitHub Actions](https://github.com/features/actions) and host the blog on [GitHub Pages](https://pages.github.com/) made it an compelling choice.

If you do want to see the source for this blog you can find it [on GitHub](https://github.com/steve-hawkins/waste-is-a-thief).

Now let's work our way backwards through those choices.

#### GitHub Pages

GitHub Pages allows for free and simple hosting of static websites and they also work with a Ruby based static site generator called [Jekyll](https://jekyllrb.com/).  Jekyll is somewhat limited when running on GitHub Pages due to [supported versions](https://pages.github.com/versions/) and for security reasons most custom plugins are blocked.

Jekyll is a bit of a learning curve, but the docs and examples out there are easy enough to follow, you just have to be careful with what does and does not work with Jekyll on GitHub Pages.

The biggest issue for me was Ruby...  I haven't done much development with Ruby since my pre-2018 [Puppet](https://www.puppet.com/) days and one thing I remember was the pain Ruby version management was, having to use something like [RVM](https://rvm.io/) (Ruby Version Management) polluting your local machine with multiple versions for all the different projects you were working on at the time.

This is where [vscode Dev Containers](https://code.visualstudio.com/docs/devcontainers/tutorial) swooped in to save the day!

A Dev Container allows you to have a consistent, contained and collaborative toolchain all from a few files in your code repository.

This is looking up, but it still means that you need to install Docker (can be a bit of a resource hog) locally and on ChromeOS that needs a little more work.

#### GitHub Codespaces

Taking the Dev Container approach a step further, if you have the .devcontainer file stored in your GitHub repository you can then create a GitHub Codespaces virtual machine and connect to it from your local vscode.  This enables you to develop on an entirely different architecture from your local device, even have a much more powerful remote device that you only use when you need it during development rather than having all that power / energy consumption all of the time.

You could go a step further by connecting to the GitHub Codespaces virtual machines vscode directly in the browser, removing the need to have vscode or anything installed locally at all and on ChromeOS that means you wouldn't even need to enable developer mode (improves security and resource consumption).  This is something I am now doing.

What is even better is that GitHub Codespaces virtual machines are free for 120 core (smallest virtual machine size is two core) hours per-month.

#### GitHub Actions

Great, we have low cost and carbon hosting and development environment, but we also need to build and publish the software for the blog website.  GitHub Actions allows you to specify and create the build and deployment steps in code along with your dev container and application code.

Quick, simple and again free.

#### network transmission emissions

A growing area of concern is the amount of energy required to power network devices and servers that make up the internet.  The BBC have covered this quite well in one of their Future articles [why your internet habits are not as clean as you think](https://www.bbc.com/future/article/20200305-why-your-internet-habits-are-not-as-clean-as-you-think).

By having code storage, virtual development machines, application build, deployment and hosting all from the same provider (GitHub) there is a hope that they are within the same ecosystem (one would assume Azure?) and the network hops required would be minimal and going out via the public internet as little as possible, with the exception of virtual development machines.

### the results

Using the [wiat.io](https://wiat.io/) website as a practical example we have looked at several areas of software products where environmental consideration can be measured and actions to manage them can be made:

- Software engineers devices
  - Environmental impact of hardware creation and transportation
  - Local software resource utilisation
  - Energy consumption whilst in use
  - Disposal when redundant / broken
- Code storage, software build and deployment
  - Energy consumption from network transmission
- Software hosting and use
  - Energy consumption from processing and network transmission

I have only really scratched the surface in terms of details, but I hope it gives people food for thought when they get back to working on an existing or starting a new software product.

I used the [Website Carbon Calculator](https://www.websitecarbon.com/) and the blog is in the best carbon rating possible:

![wiat.io carbon]({{site.baseurl}}/assets/wiat-io-carbon.png)

This results in an average of 0.02 gCO2e (grams carbon dioxide equivilent) per-visit to articles in the [wiat.io](https://wiat.io/) blog and in comparison the few [Medium](https://medium.com/) articles I have tested range in the B to C rating with an average of 0.47 gCO2e per-visit.

If you have a website I would encourage you to add the Website Carbon Calculator badge as I have here in the footer to help raise awareness of the emissions from everyday browsing.
