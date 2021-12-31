+++ 
draft = false
date = "2020-05-18"
title = "What's the story?"
description = ""
slug = ""
authors = ["Conor Mc Govern"]
tags = ["CompSoc", "IDP", "LDAP", "NodeJS", "NUIG", "plans", "services", "society"]
categories = ["CompSoc"]
externalLink = ""
series = []
translationKey = "whats-the-story"
+++

There are many ways to answer this question. I'm now coming into my third year of college and need to start focusing on personal projects for my own good (as I have lost touch with having fun with technology) and the good of my CV. I also need to start taking responsibility of the Computer Society; I'm the Chief System Administrator as of July and I want to make this year count as I have a great team and we can really get things working for years to come. 

## What do I have planned with CompSoc? 
Currently CompSoc is in a state of enigma. Services are spread across multiple machines, across multiple buildings; which isn't a problem, it's great that we have gotten to a state of redundancy, even though that only came into fruition because of a pandemic. Some services are old and break regularly, others were setup as temporary measures and have remained as permanent measures (the saying: temporary until permanent really does apply most of the time). During the coming year I am to get our services to a point where they are: 
* Reliable: Have an uptime of 99.95% over a period of a month (exclude planned maintenance). This may be the most difficult of all as for the most part, we do not control our uptime, NUIG does, as they control when our network goes down or when electricity is cut, sometimes without notice. 
* Accessible: The main issue I see with CompSoc is that we provide too many services for alumni and not enough for current members. Don't get me wrong, I love providing everything we do for the people that have left, and I have no problem with them using our services; but we need to focus on bringing CompSoc into 2020. CompSoc still needs you to email your details to get an account, to email when you've an issue and to email about your interest. Which brings me to my next point. We need to start making CompSoc accessible to not just the nerds that know about Linux, we need to be embracing the people that know nothing and need a good user experience. 
* Automated: Why isn't CompSoc hooked into Edugate's IDP, the societies website or NUIG's IDP (Shibboleth)? This summer I want everything to be automated, the main things that need to be fixed are account creation, incremental backups and VM snapshots. If we get that sorted, we'll be fairly golden.

My big project this summer is to develop a NodeJS application along side Laura and David (System Admins) that will handle all account creations within the society so that there will be no real reason to have to amend the LDAP directory directly. The reason I want to the majority of this in NodeJS is because most of our committee members come from CSIT in NUI Galway; NodeJS is taught in depth instead of the likes of python. Therefore this project will be maintainable by people for years to come. There is too much to mention here that needs to be done. Hopefully over the span of the year, I will be updating here as I go.

## What do I have planned for myself? 
I find it hard to look back on what I have achieved, this website will act as a repo of all of my goings on. Setting up my old samba/plex/torrent box server would be pretty cool too.