+++ 
draft = false
date = "2020-05-21"
title = "[object Object]"
description = ""
slug = ""
authors = ["Conor Mc Govern"]
tags = ["CompSoc", "funny errors"]
categories = ["CompSoc"]
externalLink = ""
series = []
translationKey = "object-object"
+++

Project Firefly. That's the cool name I came up with for CompSoc's account creation software. Brilliant, I know. I'm not really sure what to call it because it's basically going to be one big monolith.

I want to make this software really customizable. CompSoc is a very flexible society and we do things differently every single year; so I want the software we write to reflect this. The reason behind coding this software in NodeJS is because traditionally our committee in CompSoc is primarily made up of IT students. This means that our committee will be taught NodeJS every year and they will be able to maintain and restructure it without having to redevelop the whole flow of account creation as I am.

Today I tried to have a go at converting the PHP script IAndCDigital gave us to query their Rest API; as you can tell from the title of this blog post, it didn't go so well. I think I'm on the right track though; converting the PHP script into a function in Node means that we will be able to call it when ever we want instead of having cron call PHP once an hour.

    axios.post(conf.socsurl, null, { params: { method: conf.socspostmethod, username: conf.socsusername, password: conf.socspasswd, encodeOutput: true }}).then((res) => { const date = new Date(); fs.writeFile(date.getHours()+".txt", res.data.Response.data, function (err) { if (err) return console.log(err); console.log("Members > " + date.getHours()); }) }).catch((err) => { console.log(err); });

The above is what I've written. It's not actually the problem at all, it's grabbing the data fine from the API but somewhere in between it's only saving what I assume to be pointers.

Once I get this working I want to figure out how magic links (links that are sent out to members that can authorize them without using their password) & how accounts are going to be temporarily saved to the database before they are pushed to LDAP (when a user has to confirm their account and make sure details are correct).

EDIT: JSON.stringify was needed.